import Standard_Library_Extensions

extension ISO_3166 {

    public enum Territory: Sendable, Equatable, Hashable {

        case country(Alpha2)

        case subdivision(Subdivision)

        case exceptional(Exceptional)
    }
}

extension ISO_3166.Territory {

    public init(_ value: some StringProtocol) throws(Error) {
        if value.contains("-") {
            do throws(ISO_3166.Subdivision.Error) {
                self = .subdivision(try ISO_3166.Subdivision(value))
            } catch {
                throw .subdivision(error)
            }
            return
        }
        do throws(ISO_3166.Alpha2.Error) {
            self = .country(try ISO_3166.Alpha2(value))
            return
        } catch {
            guard case .invalidAlpha2Code = error else {
                throw .country(error)
            }
        }
        do throws(ISO_3166.Exceptional.Error) {
            self = .exceptional(try ISO_3166.Exceptional(value))
        } catch {
            throw .exceptional(error)
        }
    }
}

extension ISO_3166.Territory {

    public var value: String {
        switch self {
        case .country(let code): code.value
        case .subdivision(let code): code.value
        case .exceptional(let code): code.value
        }
    }
}

extension ISO_3166.Territory: CustomStringConvertible {
    public var description: String { value }
}

extension ISO_3166.Territory: Codable {

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

extension ISO_3166.Territory {

    public static let allCases: [ISO_3166.Territory] =
        ISO_3166.Alpha2.allCases.map(Self.country)
        + ISO_3166.Subdivision.allCases.map(Self.subdivision)
        + ISO_3166.Exceptional.allCases.map(Self.exceptional)
}

extension ISO_3166.Territory: CaseIterable {}
