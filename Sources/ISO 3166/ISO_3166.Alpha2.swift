// ISO_3166.Alpha2.swift
// ISO 3166
//
// Two-letter country code (ISO 3166-1 alpha-2)

import ASCII_Primitives
import Standard_Library_Extensions

extension ISO_3166 {
    /// Two-letter country code per ISO 3166-1 alpha-2
    ///
    /// Refined type representing a valid 2-letter country code.
    /// Common codes like "us", "gb", "jp", "de", etc.
    ///
    /// ## Validation
    ///
    /// - Exactly 2 ASCII letters
    /// - Lowercase
    /// - Must be a recognized ISO 3166-1 alpha-2 code
    ///
    /// ## Example
    ///
    /// ```swift
    /// let us = try ISO_3166.Alpha2("us")
    /// print(us.value)  // "us"
    /// ```
    public struct Alpha2: Sendable, Equatable, Hashable {
        /// The two-letter code value
        public let value: String

        /// Creates a two-letter code (partial function)
        ///
        /// Validates that the string is a recognized ISO 3166-1 alpha-2 code.
        ///
        /// - Parameter value: Two-letter code string
        /// - Throws: `Alpha2.Error` if invalid
        public init(_ value: some StringProtocol) throws(Error) {
            let normalized = value.lowercased()

            // Validate length
            guard normalized.count == 2 else {
                throw Alpha2.Error.invalidCodeLength(normalized.count)
            }

            // Validate ASCII letters only
            guard normalized.allSatisfy({ $0.ascii.isLetter }) else {
                throw Alpha2.Error.invalidCharacters(normalized)
            }

            // Validate it's a recognized code
            guard Self.validCodes.contains(normalized) else {
                throw Alpha2.Error.invalidAlpha2Code(normalized)
            }

            self.value = normalized
        }
    }
}

extension ISO_3166.Alpha2 {
    /// Creates a two-letter code without validation (internal use only)
    ///
    /// - Warning: Only use when the value is guaranteed to be valid
    /// - Parameter value: Pre-validated two-letter code
    internal init(unchecked value: String) {
        self.value = value
    }

    /// Set of valid ISO 3166-1 alpha-2 (2-letter) code strings for validation
    ///
    /// Computed from `allCases` for consistency.
    internal static let validCodes: Set<String> = {
        Set(allCases.map { $0.value })
    }()
}

// MARK: - String Representation

extension ISO_3166.Alpha2: CustomStringConvertible {
    public var description: String { value }
}

// MARK: - Codable

extension ISO_3166.Alpha2: Codable {
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

extension ISO_3166.Alpha2 {
    /// Converts a three-letter code to its two-letter equivalent (total function)
    ///
    /// This is the authoritative conversion from ISO 3166-1 alpha-3 to alpha-2.
    /// All ISO 3166-1 alpha-3 codes have corresponding alpha-2 codes by definition,
    /// so this conversion never fails.
    ///
    /// ## Performance
    /// - Time complexity: O(1) via hash table lookup
    /// - Space complexity: O(1)
    ///
    /// - Parameter alpha3: Three-letter country code
    public init(_ alpha3: ISO_3166.Alpha3) {
        // Performance: O(1) dictionary lookup
        // Force unwrap is safe: all ISO 3166-1 alpha-3 codes have alpha-2 equivalents
        let alpha2 = ISO_3166.alpha3ToAlpha2[alpha3]!
        self = alpha2
    }

    /// Converts a numeric code to its two-letter equivalent (total function)
    ///
    /// This is the authoritative conversion from ISO 3166-1 numeric to alpha-2.
    /// All ISO 3166-1 numeric codes have corresponding alpha-2 codes by definition,
    /// so this conversion never fails.
    ///
    /// ## Performance
    /// - Time complexity: O(1) via hash table lookup
    /// - Space complexity: O(1)
    ///
    /// - Parameter numeric: Numeric country code
    public init(_ numeric: ISO_3166.Numeric) {
        // Performance: O(1) dictionary lookup
        // Force unwrap is safe: all ISO 3166-1 numeric codes have alpha-2 equivalents
        let alpha2 = ISO_3166.numericToAlpha2[numeric]!
        self = alpha2
    }
}
