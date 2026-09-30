import Testing

@testable import ISO_3166

@Suite
struct `Code table consistency` {
    @Test
    func `every alpha-3 code converts to an alpha-2 code and back`() {
        for alpha3 in ISO_3166.Alpha3.allCases {
            #expect(ISO_3166.Alpha3(ISO_3166.Alpha2(alpha3)) == alpha3)
        }
    }

    @Test
    func `every numeric code converts to an alpha-2 code and back`() {
        for numeric in ISO_3166.Numeric.allCases {
            #expect(ISO_3166.Numeric(ISO_3166.Alpha2(numeric)) == numeric)
        }
    }

    @Test
    func `every alpha-2 code converts to alpha-3 and numeric codes`() {
        for alpha2 in ISO_3166.Alpha2.allCases {
            #expect(ISO_3166.Alpha2(ISO_3166.Alpha3(alpha2)) == alpha2)
            #expect(ISO_3166.Alpha2(ISO_3166.Numeric(alpha2)) == alpha2)
        }
    }

}
