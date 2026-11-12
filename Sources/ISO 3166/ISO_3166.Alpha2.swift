import ASCII
import Standard_Library_Extensions

extension ISO_3166 {

    public struct Alpha2: Sendable, Equatable, Hashable {

        public let value: String

        public init(_ value: some StringProtocol) throws(Error) {
            guard value.allSatisfy({ $0.isASCII }) else {
                throw Alpha2.Error.invalidCharacters(String(value))
            }

            let normalized = value.lowercased()

            guard normalized.count == 2 else {
                throw Alpha2.Error.invalidCodeLength(normalized.count)
            }

            guard normalized.allSatisfy({ $0.ascii.isLetter }) else {
                throw Alpha2.Error.invalidCharacters(normalized)
            }

            guard Self.validCodes.contains(normalized) else {
                throw Alpha2.Error.invalidAlpha2Code(normalized)
            }

            self.value = normalized
        }
    }
}

extension ISO_3166.Alpha2 {

    internal init(unchecked value: String) {
        self.value = value
    }

    internal static let validCodes: Set<String> = {
        Set(allCases.map { $0.value })
    }()
}

extension ISO_3166.Alpha2: CustomStringConvertible {
    public var description: String { value }
}

extension ISO_3166.Alpha2: Codable {

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        try self.init(string)
    }
}

extension ISO_3166.Alpha2 {

    public init(_ alpha3: ISO_3166.Alpha3) {

        guard let alpha2 = ISO_3166.alpha3ToAlpha2[alpha3] else {
            preconditionFailure("Every alpha3 code has a mapping")
        }
        self = alpha2
    }

    public init(_ numeric: ISO_3166.Numeric) {

        guard let alpha2 = ISO_3166.numericToAlpha2[numeric] else {
            preconditionFailure("Every numeric code has a mapping")
        }
        self = alpha2
    }
}
