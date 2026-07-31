// ISO_3166.Alpha3.swift
// ISO 3166
//
// Three-letter country code (ISO 3166-1 alpha-3)

import ASCII_Primitives
import Standard_Library_Extensions

extension ISO_3166 {
    /// Three-letter country code per ISO 3166-1 alpha-3
    ///
    /// Refined type representing a valid 3-letter country code.
    /// Common codes like "usa", "gbr", "jpn", "deu", etc.
    ///
    /// ## Validation
    ///
    /// - Exactly 3 ASCII letters
    /// - Lowercase
    /// - Must be a recognized ISO 3166-1 alpha-3 code
    ///
    /// ## Example
    ///
    /// ```swift
    /// let usa = try ISO_3166.Alpha3("usa")
    /// print(usa.value)  // "usa"
    /// ```
    public struct Alpha3: Sendable, Equatable, Hashable {
        /// The three-letter code value
        public let value: String

        /// Creates a three-letter code (partial function)
        ///
        /// Validates that the string is a recognized ISO 3166-1 alpha-3 code.
        ///
        /// - Parameter value: Three-letter code string
        /// - Throws: `Alpha3.Error` if invalid
        public init(_ value: some StringProtocol) throws(Error) {
            let normalized = value.lowercased()

            // Validate length
            guard normalized.count == 3 else {
                throw Alpha3.Error.invalidCodeLength(normalized.count)
            }

            // Validate ASCII letters only
            guard normalized.allSatisfy({ $0.ascii.isLetter }) else {
                throw Alpha3.Error.invalidCharacters(normalized)
            }

            // Validate it's a recognized code
            guard Self.validCodes.contains(normalized) else {
                throw Alpha3.Error.invalidAlpha3Code(normalized)
            }

            self.value = normalized
        }
    }
}

extension ISO_3166.Alpha3 {
    /// Creates a three-letter code without validation (internal use only)
    ///
    /// - Warning: Only use when the value is guaranteed to be valid
    /// - Parameter value: Pre-validated three-letter code
    internal init(unchecked value: String) {
        self.value = value
    }

    /// Set of valid ISO 3166-1 alpha-3 (3-letter) code strings for validation
    ///
    /// Computed from `allCases` for consistency.
    internal static let validCodes: Set<String> = {
        Set(allCases.map { $0.value })
    }()
}

// MARK: - String Representation

extension ISO_3166.Alpha3: CustomStringConvertible {
    public var description: String { value }
}

// MARK: - Codable

extension ISO_3166.Alpha3: Codable {
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

extension ISO_3166.Alpha3 {
    /// Converts a two-letter code to its three-letter equivalent (total function)
    ///
    /// This is the authoritative conversion from ISO 3166-1 alpha-2 to alpha-3.
    /// All ISO 3166-1 alpha-2 codes have corresponding alpha-3 codes by definition,
    /// so this conversion never fails.
    ///
    /// ## Performance
    /// - Time complexity: O(1) via hash table lookup
    /// - Space complexity: O(1)
    ///
    /// - Parameter alpha2: Two-letter country code
    public init(_ alpha2: ISO_3166.Alpha2) {
        // Performance: O(1) dictionary lookup
        // Force unwrap is safe: all ISO 3166-1 alpha-2 codes have alpha-3 equivalents
        let alpha3 = ISO_3166.alpha2ToAlpha3[alpha2]!
        self = alpha3
    }
}
