import Standard_Library_Extensions

extension ISO_3166 {

    public enum Error: Swift::Error, Sendable, Equatable {

        case invalidCodeLength(Int)

        case invalidCharacters(String)

        case invalidAlpha2Code(String)

        case invalidAlpha3Code(String)

        case invalidNumericCode(String)
    }
}
