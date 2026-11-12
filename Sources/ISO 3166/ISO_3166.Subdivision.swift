import ASCII
import Standard_Library_Extensions

extension ISO_3166 {

    public struct Subdivision: Sendable, Equatable, Hashable {

        public let value: String

        public init(_ value: some StringProtocol) throws(Error) {
            guard value.allSatisfy({ $0.isASCII }) else {
                throw Subdivision.Error.invalidCharacters(String(value))
            }

            let normalized = value.lowercased()
            let parts = normalized.split(separator: "-", omittingEmptySubsequences: false)

            guard parts.count == 2, parts[0].count == 2, (1...3).contains(parts[1].count) else {
                throw Subdivision.Error.invalidFormat(normalized)
            }

            guard parts[0].allSatisfy({ $0.ascii.isLetter }),
                parts[1].allSatisfy({ $0.ascii.isLetter || $0.ascii.isDigit })
            else {
                throw Subdivision.Error.invalidCharacters(normalized)
            }

            guard Self.validCodes.contains(normalized) else {
                throw Subdivision.Error.invalidSubdivisionCode(normalized)
            }

            self.value = normalized
        }
    }
}

extension ISO_3166.Subdivision {

    internal init(unchecked value: String) {
        self.value = value
    }

    internal static let validCodes: Set<String> = {
        Set(allCases.map { $0.value })
    }()
}

extension ISO_3166.Subdivision {

    public var country: ISO_3166.Alpha2 {
        ISO_3166.Alpha2(unchecked: String(value.prefix(2)))
    }
}

extension ISO_3166.Subdivision: CustomStringConvertible {
    public var description: String { value }
}

extension ISO_3166.Subdivision: Codable {

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
