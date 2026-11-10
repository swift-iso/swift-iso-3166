extension ISO_3166.Territory {

    public enum Error: Swift::Error, Sendable, Equatable {

        case country(ISO_3166.Alpha2.Error)

        case subdivision(ISO_3166.Subdivision.Error)

        case exceptional(ISO_3166.Exceptional.Error)
    }
}
