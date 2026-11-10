extension ISO_3166.Exceptional {

    public enum Error: Swift::Error, Sendable, Equatable {

        case invalidCodeLength(Int)

        case invalidCharacters(String)

        case invalidExceptionalCode(String)
    }
}
