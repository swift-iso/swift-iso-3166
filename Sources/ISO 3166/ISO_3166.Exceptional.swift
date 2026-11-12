import ASCII
import Standard_Library_Extensions

extension ISO_3166 {

    public struct Exceptional: Sendable, Equatable, Hashable {

        public let value: String

        public init(_ value: some StringProtocol) throws(Error) {
            guard value.allSatisfy({ $0.isASCII }) else {
                throw Exceptional.Error.invalidCharacters(String(value))
            }

            let normalized = value.lowercased()

            guard normalized.count == 2 else {
                throw Exceptional.Error.invalidCodeLength(normalized.count)
            }

            guard normalized.allSatisfy({ $0.ascii.isLetter }) else {
                throw Exceptional.Error.invalidCharacters(normalized)
            }

            guard Self.validCodes.contains(normalized) else {
                throw Exceptional.Error.invalidExceptionalCode(normalized)
            }

            self.value = normalized
        }
    }
}

extension ISO_3166.Exceptional {

    internal init(unchecked value: String) {
        self.value = value
    }

    internal static let validCodes: Set<String> = {
        Set(allCases.map { $0.value })
    }()
}

extension ISO_3166.Exceptional: CaseIterable {
    public static let allCases: [ISO_3166.Exceptional] = [
        .ac, .cp, .cq, .dg, .ea, .eu, .ez, .fx, .ic, .su, .ta, .uk, .un,
    ]
}

extension ISO_3166.Exceptional {

    public static let ac = ISO_3166.Exceptional(unchecked: "ac")

    public static let cp = ISO_3166.Exceptional(unchecked: "cp")

    public static let cq = ISO_3166.Exceptional(unchecked: "cq")

    public static let dg = ISO_3166.Exceptional(unchecked: "dg")

    public static let ea = ISO_3166.Exceptional(unchecked: "ea")

    public static let eu = ISO_3166.Exceptional(unchecked: "eu")

    public static let ez = ISO_3166.Exceptional(unchecked: "ez")

    public static let fx = ISO_3166.Exceptional(unchecked: "fx")

    public static let ic = ISO_3166.Exceptional(unchecked: "ic")

    public static let su = ISO_3166.Exceptional(unchecked: "su")

    public static let ta = ISO_3166.Exceptional(unchecked: "ta")

    public static let uk = ISO_3166.Exceptional(unchecked: "uk")

    public static let un = ISO_3166.Exceptional(unchecked: "un")
}

extension ISO_3166.Exceptional: CustomStringConvertible {
    public var description: String { value }
}

#if !hasFeature(Embedded)
    extension ISO_3166.Exceptional: Codable {

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
#endif
