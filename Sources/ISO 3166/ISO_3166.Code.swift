import ASCII
import Standard_Library_Extensions

extension ISO_3166 {

    public enum Code: Sendable, Equatable, Hashable {

        case alpha2(Alpha2)

        case alpha3(Alpha3)

        case numeric(Numeric)
    }
}

extension ISO_3166.Code: CustomStringConvertible {
    public var description: String {
        switch self {
        case .alpha2(let code):
            return code.value

        case .alpha3(let code):
            return code.value

        case .numeric(let code):
            return code.value
        }
    }
}

extension ISO_3166.Code {

    public init(_ code: some StringProtocol) throws(ISO_3166.Error) {
        guard code.allSatisfy(\.isASCII) else {
            throw ISO_3166.Error.invalidCharacters(String(code))
        }

        let normalized = code.lowercased()

        switch normalized.count {
        case 2:
            do throws(ISO_3166.Alpha2.Error) {
                let alpha2 = try ISO_3166.Alpha2(normalized)
                self = .alpha2(alpha2)
            } catch {
                switch error {
                case .invalidCodeLength(let n): throw .invalidCodeLength(n)
                case .invalidCharacters(let s): throw .invalidCharacters(s)
                case .invalidAlpha2Code(let s): throw .invalidAlpha2Code(s)
                }
            }

        case 3:

            if normalized.allSatisfy({ $0.ascii.isLetter }) {
                do throws(ISO_3166.Alpha3.Error) {
                    let alpha3 = try ISO_3166.Alpha3(normalized)
                    self = .alpha3(alpha3)
                } catch {
                    switch error {
                    case .invalidCodeLength(let n): throw .invalidCodeLength(n)
                    case .invalidCharacters(let s): throw .invalidCharacters(s)
                    case .invalidAlpha3Code(let s): throw .invalidAlpha3Code(s)
                    }
                }
            }

            else if normalized.allSatisfy({ $0.ascii.isDigit }) {
                do throws(ISO_3166.Numeric.Error) {
                    let numeric = try ISO_3166.Numeric(normalized)
                    self = .numeric(numeric)
                } catch {
                    switch error {
                    case .invalidCodeLength(let n): throw .invalidCodeLength(n)
                    case .invalidCharacters(let s): throw .invalidCharacters(s)
                    case .invalidNumericCode(let s): throw .invalidNumericCode(s)
                    }
                }
            } else {
                throw .invalidCodeLength(normalized.count)
            }

        default:
            throw .invalidCodeLength(normalized.count)
        }
    }
}

extension ISO_3166.Code: Codable {

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(description)
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        try self.init(string)
    }
}
