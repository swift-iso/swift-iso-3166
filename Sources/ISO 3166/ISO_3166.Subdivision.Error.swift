extension ISO_3166.Subdivision {

    public enum Error: Swift::Error, Sendable, Equatable {

        case invalidFormat(String)

        case invalidCharacters(String)

        case invalidSubdivisionCode(String)
    }
}
