// ISO_3166.Numeric.swift
// ISO 3166
//
// Numeric country code (ISO 3166-1 numeric)

import ASCII_Primitives
import Standard_Library_Extensions

extension ISO_3166 {
    /// Numeric country code per ISO 3166-1 numeric
    ///
    /// Refined type representing a valid 3-digit numeric country code.
    /// Common codes like "840" (US), "826" (GB), "392" (JP), "276" (DE), etc.
    ///
    /// ## Validation
    ///
    /// - Exactly 3 ASCII digits
    /// - Must be a recognized ISO 3166-1 numeric code
    ///
    /// ## Example
    ///
    /// ```swift
    /// let us = try ISO_3166.Numeric("840")
    /// print(us.value)  // "840"
    /// ```
    public struct Numeric: Sendable, Equatable, Hashable {
        /// The three-digit numeric code value
        public let value: String

        /// Creates a numeric code (partial function)
        ///
        /// Validates that the string is a recognized ISO 3166-1 numeric code.
        ///
        /// - Parameter value: Three-digit numeric code string
        /// - Throws: `Numeric.Error` if invalid
        public init(_ value: some StringProtocol) throws(Error) {
            // Numeric codes are not case-sensitive, but we normalize for consistency
            let normalized = String(value)

            // Validate length
            guard normalized.count == 3 else {
                throw Numeric.Error.invalidCodeLength(normalized.count)
            }

            // Validate ASCII digits only
            guard normalized.allSatisfy({ $0.ascii.isDigit }) else {
                throw Numeric.Error.invalidCharacters(normalized)
            }

            // Validate it's a recognized code
            guard Self.validCodes.contains(normalized) else {
                throw Numeric.Error.invalidNumericCode(normalized)
            }

            self.value = normalized
        }
    }
}

extension ISO_3166.Numeric {
    /// Creates a numeric code without validation (internal use only)
    ///
    /// - Warning: Only use when the value is guaranteed to be valid
    /// - Parameter value: Pre-validated numeric code
    internal init(unchecked value: String) {
        self.value = value
    }

    /// Set of valid ISO 3166-1 numeric (3-digit) code strings for validation
    ///
    /// Computed from `allCases` for consistency.
    internal static let validCodes: Set<String> = {
        Set(allCases.map { $0.value })
    }()
}

// MARK: - String Representation

extension ISO_3166.Numeric: CustomStringConvertible {
    public var description: String { value }
}

// MARK: - Codable

extension ISO_3166.Numeric: Codable {
    // REASON: `Swift.Encodable.encode(to:)` is declared with untyped `throws`
    // upstream; a conforming implementation is signature-forced and cannot
    // express `throws(E)`.
    // swiftlint:disable:next typed_throws_required
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }

    // REASON: `Swift.Decodable.init(from:)` is declared with untyped `throws`
    // upstream; a conforming implementation is signature-forced and cannot
    // express `throws(E)`.
    // swiftlint:disable:next typed_throws_required
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        try self.init(string)
    }
}

// MARK: - Conversions

extension ISO_3166.Numeric {
    /// Converts a two-letter code to its numeric equivalent (total function)
    ///
    /// This is the authoritative conversion from ISO 3166-1 alpha-2 to numeric.
    /// All ISO 3166-1 alpha-2 codes have corresponding numeric codes by definition,
    /// so this conversion never fails.
    ///
    /// ## Performance
    /// - Time complexity: O(1) via hash table lookup
    /// - Space complexity: O(1)
    ///
    /// - Parameter alpha2: Two-letter country code
    public init(_ alpha2: ISO_3166.Alpha2) {
        // Performance: O(1) dictionary lookup
        // Force unwrap is safe: all ISO 3166-1 alpha-2 codes have numeric equivalents
        let numeric = ISO_3166.alpha2ToNumeric[alpha2]!
        self = numeric
    }
}
