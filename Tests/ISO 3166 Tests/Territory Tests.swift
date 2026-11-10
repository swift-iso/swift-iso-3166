import Foundation
import Testing

@testable import ISO_3166

enum `Territory Tests` {}

extension `Territory Tests` {
    @Suite
    struct Subdivision {
        @Test
        func `a listed subdivision in any case is one lower-case value`() throws {
            #expect(try ISO_3166.Subdivision("US-NV") == ISO_3166.Subdivision("us-nv"))
            #expect(try ISO_3166.Subdivision("Us-Nv").description == "us-nv")
        }

        @Test
        func `an unlisted subdivision is refused`() {
            #expect(throws: ISO_3166.Subdivision.Error.invalidSubdivisionCode("us-zz")) {
                try ISO_3166.Subdivision("us-zz")
            }
        }

        @Test
        func `a code without one hyphen is refused`() {
            #expect(throws: ISO_3166.Subdivision.Error.invalidFormat("usnv")) {
                try ISO_3166.Subdivision("usnv")
            }
            #expect(throws: ISO_3166.Subdivision.Error.invalidFormat("us-nv-x")) {
                try ISO_3166.Subdivision("us-nv-x")
            }
        }

        @Test
        func `a Kelvin sign is refused`() {
            #expect(throws: ISO_3166.Subdivision.Error.self) { try ISO_3166.Subdivision("us-\u{212A}y") }
        }

        @Test
        func `a subdivision names its country`() throws {
            #expect(try ISO_3166.Subdivision("nl-nh").country == .nl)
        }

        @Test
        func `every listed subdivision belongs to an assigned country`() {
            for subdivision in ISO_3166.Subdivision.allCases {
                #expect(ISO_3166.Alpha2.validCodes.contains(String(subdivision.value.prefix(2))))
            }
        }

        @Test
        func `a subdivision encodes as one string and decoding checks it`() throws {
            let data = try JSONEncoder().encode(try ISO_3166.Subdivision("NL-NH"))
            #expect(String(decoding: data, as: UTF8.self) == "\"nl-nh\"")
            #expect(throws: (any Swift.Error).self) {
                try JSONDecoder().decode(ISO_3166.Subdivision.self, from: Data("\"nl-zz\"".utf8))
            }
        }
    }

    @Suite
    struct Exceptional {
        @Test
        func `the thirteen exceptionally reserved codes are read`() throws {
            for code in ["ac", "cp", "cq", "dg", "ea", "eu", "ez", "fx", "ic", "su", "ta", "uk", "un"] {
                #expect(try ISO_3166.Exceptional(code.uppercased()).value == code)
            }
            #expect(ISO_3166.Exceptional.allCases.count == 13)
        }

        @Test
        func `an assigned country code is not exceptional`() {
            #expect(throws: ISO_3166.Exceptional.Error.invalidExceptionalCode("nl")) {
                try ISO_3166.Exceptional("nl")
            }
        }
    }

    @Suite
    struct Territory {
        @Test
        func `two assigned letters are a country`() throws {
            #expect(try ISO_3166.Territory("NL") == .country(.nl))
        }

        @Test
        func `two reserved letters are exceptional`() throws {
            #expect(try ISO_3166.Territory("EU") == .exceptional(.eu))
        }

        @Test
        func `a hyphen makes a subdivision`() throws {
            #expect(try ISO_3166.Territory("US-NV") == .subdivision(ISO_3166.Subdivision("us-nv")))
        }

        @Test
        func `an unassigned code is refused`() {
            #expect(throws: ISO_3166.Territory.Error.self) { try ISO_3166.Territory("zz") }
            #expect(throws: ISO_3166.Territory.Error.self) { try ISO_3166.Territory("zz-01") }
            #expect(throws: ISO_3166.Territory.Error.self) { try ISO_3166.Territory("nld") }
        }

        @Test
        func `a territory prints its lower-case code`() throws {
            #expect(try ISO_3166.Territory("NL").description == "nl")
            #expect(try ISO_3166.Territory("US-NV").description == "us-nv")
            #expect(try ISO_3166.Territory("EU").description == "eu")
        }

        @Test
        func `no code is both a country and exceptional`() {
            for exceptional in ISO_3166.Exceptional.allCases {
                #expect(!ISO_3166.Alpha2.validCodes.contains(exceptional.value))
            }
        }

        @Test
        func `a territory encodes as one string`() throws {
            let data = try JSONEncoder().encode(ISO_3166.Territory.exceptional(.eu))
            #expect(String(decoding: data, as: UTF8.self) == "\"eu\"")
            #expect(try JSONDecoder().decode(ISO_3166.Territory.self, from: Data("\"US-NV\"".utf8)).description == "us-nv")
        }
    }
}
