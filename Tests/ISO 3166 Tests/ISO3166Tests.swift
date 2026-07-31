// ISO3166Tests.swift
// ISO 3166 Tests

import Foundation
import Testing

@testable import ISO_3166

extension ISO_3166 {
    @Suite("ISO 3166 Country Codes")
    struct Tests {
        @Suite struct Unit {}
        @Suite struct `Edge Case` {}
        @Suite struct Integration {}
    }
}

// MARK: - Unit

extension ISO_3166.Tests.Unit {

    // MARK: - Alpha2 Tests

    @Test
    func `Alpha2: Valid 2-letter codes`() throws {
        let us = try ISO_3166.Alpha2("us")
        #expect(us.value == "us")

        let gb = try ISO_3166.Alpha2("GB")  // Test case normalization
        #expect(gb.value == "gb")

        let jp = try ISO_3166.Alpha2("Jp")  // Test mixed case
        #expect(jp.value == "jp")
    }

    @Test
    func `Alpha2: Invalid length`() {
        #expect(throws: ISO_3166.Alpha2.Error.invalidCodeLength(1)) {
            try ISO_3166.Alpha2("u")
        }

        #expect(throws: ISO_3166.Alpha2.Error.invalidCodeLength(3)) {
            try ISO_3166.Alpha2("usa")
        }

        #expect(throws: ISO_3166.Alpha2.Error.invalidCodeLength(0)) {
            try ISO_3166.Alpha2("")
        }
    }

    @Test
    func `Alpha2: Invalid characters`() {
        #expect(throws: ISO_3166.Alpha2.Error.invalidCharacters("u1")) {
            try ISO_3166.Alpha2("u1")
        }

        #expect(throws: ISO_3166.Alpha2.Error.invalidCharacters("u-")) {
            try ISO_3166.Alpha2("u-")
        }

        #expect(throws: ISO_3166.Alpha2.Error.invalidCharacters("u ")) {
            try ISO_3166.Alpha2("u ")
        }
    }

    @Test
    func `Alpha2: Unrecognized code`() {
        #expect(throws: ISO_3166.Alpha2.Error.invalidAlpha2Code("zz")) {
            try ISO_3166.Alpha2("zz")
        }

        #expect(throws: ISO_3166.Alpha2.Error.invalidAlpha2Code("xx")) {
            try ISO_3166.Alpha2("xx")
        }
    }

    @Test
    func `Alpha2: Common static constants`() {
        #expect(ISO_3166.Alpha2.us.value == "us")
        #expect(ISO_3166.Alpha2.gb.value == "gb")
        #expect(ISO_3166.Alpha2.jp.value == "jp")
        #expect(ISO_3166.Alpha2.de.value == "de")
        #expect(ISO_3166.Alpha2.fr.value == "fr")
        #expect(ISO_3166.Alpha2.cn.value == "cn")
        #expect(ISO_3166.Alpha2.ca.value == "ca")
        #expect(ISO_3166.Alpha2.au.value == "au")
    }

    @Test
    func `Alpha2: String conversion`() {
        #expect(ISO_3166.Alpha2.us.description == "us")
        #expect(String(describing: ISO_3166.Alpha2.gb) == "gb")
    }

    @Test
    func `Alpha2: Equality and hashing`() {
        let us1 = ISO_3166.Alpha2.us
        let us2 = ISO_3166.Alpha2.us
        #expect(us1 == us2)
        #expect(us1.hashValue == us2.hashValue)

        let gb = ISO_3166.Alpha2.gb
        #expect(us1 != gb)
    }

    @Test
    func `Alpha2: Codable round-trip`() throws {
        let original = ISO_3166.Alpha2.us
        let encoder = JSONEncoder()
        let data = try encoder.encode(original)
        let decoder = JSONDecoder()
        let decoded = try decoder.decode(ISO_3166.Alpha2.self, from: data)
        #expect(decoded == original)
        #expect(decoded.value == "us")
    }

    // MARK: - Alpha3 Tests

    @Test
    func `Alpha3: Valid 3-letter codes`() throws {
        let usa = try ISO_3166.Alpha3("usa")
        #expect(usa.value == "usa")

        let gbr = try ISO_3166.Alpha3("GBR")  // Test case normalization
        #expect(gbr.value == "gbr")

        let jpn = try ISO_3166.Alpha3("Jpn")  // Test mixed case
        #expect(jpn.value == "jpn")
    }

    @Test
    func `Alpha3: Invalid length`() {
        #expect(throws: ISO_3166.Alpha3.Error.invalidCodeLength(2)) {
            try ISO_3166.Alpha3("us")
        }

        #expect(throws: ISO_3166.Alpha3.Error.invalidCodeLength(4)) {
            try ISO_3166.Alpha3("usaa")
        }

        #expect(throws: ISO_3166.Alpha3.Error.invalidCodeLength(0)) {
            try ISO_3166.Alpha3("")
        }
    }

    @Test
    func `Alpha3: Invalid characters`() {
        #expect(throws: ISO_3166.Alpha3.Error.invalidCharacters("us1")) {
            try ISO_3166.Alpha3("us1")
        }

        #expect(throws: ISO_3166.Alpha3.Error.invalidCharacters("us-")) {
            try ISO_3166.Alpha3("us-")
        }

        #expect(throws: ISO_3166.Alpha3.Error.invalidCharacters("us ")) {
            try ISO_3166.Alpha3("us ")
        }
    }

    @Test
    func `Alpha3: Unrecognized code`() {
        #expect(throws: ISO_3166.Alpha3.Error.invalidAlpha3Code("zzz")) {
            try ISO_3166.Alpha3("zzz")
        }

        #expect(throws: ISO_3166.Alpha3.Error.invalidAlpha3Code("xxx")) {
            try ISO_3166.Alpha3("xxx")
        }
    }

    @Test
    func `Alpha3: Common static constants`() {
        #expect(ISO_3166.Alpha3.usa.value == "usa")
        #expect(ISO_3166.Alpha3.gbr.value == "gbr")
        #expect(ISO_3166.Alpha3.jpn.value == "jpn")
        #expect(ISO_3166.Alpha3.deu.value == "deu")
        #expect(ISO_3166.Alpha3.fra.value == "fra")
        #expect(ISO_3166.Alpha3.chn.value == "chn")
        #expect(ISO_3166.Alpha3.can.value == "can")
        #expect(ISO_3166.Alpha3.aus.value == "aus")
    }

    @Test
    func `Alpha3: String conversion`() {
        #expect(ISO_3166.Alpha3.usa.description == "usa")
        #expect(String(describing: ISO_3166.Alpha3.gbr) == "gbr")
    }

    @Test
    func `Alpha3: Equality and hashing`() {
        let usa1 = ISO_3166.Alpha3.usa
        let usa2 = ISO_3166.Alpha3.usa
        #expect(usa1 == usa2)
        #expect(usa1.hashValue == usa2.hashValue)

        let gbr = ISO_3166.Alpha3.gbr
        #expect(usa1 != gbr)
    }

    @Test
    func `Alpha3: Codable round-trip`() throws {
        let original = ISO_3166.Alpha3.usa
        let encoder = JSONEncoder()
        let data = try encoder.encode(original)
        let decoder = JSONDecoder()
        let decoded = try decoder.decode(ISO_3166.Alpha3.self, from: data)
        #expect(decoded == original)
        #expect(decoded.value == "usa")
    }

    // MARK: - Numeric Tests

    @Test
    func `Numeric: Valid numeric codes`() throws {
        let us = try ISO_3166.Numeric("840")
        #expect(us.value == "840")

        let gb = try ISO_3166.Numeric("826")
        #expect(gb.value == "826")

        let jp = try ISO_3166.Numeric("392")
        #expect(jp.value == "392")
    }

    @Test
    func `Numeric: Invalid length`() {
        #expect(throws: ISO_3166.Numeric.Error.invalidCodeLength(2)) {
            try ISO_3166.Numeric("84")
        }

        #expect(throws: ISO_3166.Numeric.Error.invalidCodeLength(4)) {
            try ISO_3166.Numeric("8400")
        }

        #expect(throws: ISO_3166.Numeric.Error.invalidCodeLength(0)) {
            try ISO_3166.Numeric("")
        }
    }

    @Test
    func `Numeric: Invalid characters`() {
        #expect(throws: ISO_3166.Numeric.Error.invalidCharacters("84a")) {
            try ISO_3166.Numeric("84a")
        }

        #expect(throws: ISO_3166.Numeric.Error.invalidCharacters("84-")) {
            try ISO_3166.Numeric("84-")
        }

        #expect(throws: ISO_3166.Numeric.Error.invalidCharacters("84 ")) {
            try ISO_3166.Numeric("84 ")
        }
    }

    @Test
    func `Numeric: Unrecognized code`() {
        #expect(throws: ISO_3166.Numeric.Error.invalidNumericCode("999")) {
            try ISO_3166.Numeric("999")
        }

        #expect(throws: ISO_3166.Numeric.Error.invalidNumericCode("000")) {
            try ISO_3166.Numeric("000")
        }
    }

    @Test
    func `Numeric: Common static constants`() {
        #expect(ISO_3166.Numeric.`840`.value == "840")  // US
        #expect(ISO_3166.Numeric.`826`.value == "826")  // GB
        #expect(ISO_3166.Numeric.`392`.value == "392")  // JP
        #expect(ISO_3166.Numeric.`276`.value == "276")  // DE
        #expect(ISO_3166.Numeric.`250`.value == "250")  // FR
        #expect(ISO_3166.Numeric.`156`.value == "156")  // CN
        #expect(ISO_3166.Numeric.`124`.value == "124")  // CA
        #expect(ISO_3166.Numeric.`036`.value == "036")  // AU
    }

    @Test
    func `Numeric: String conversion`() {
        #expect(ISO_3166.Numeric.`840`.description == "840")
        #expect(String(describing: ISO_3166.Numeric.`826`) == "826")
    }

    @Test
    func `Numeric: Equality and hashing`() {
        let us1 = ISO_3166.Numeric.`840`
        let us2 = ISO_3166.Numeric.`840`
        #expect(us1 == us2)
        #expect(us1.hashValue == us2.hashValue)

        let gb = ISO_3166.Numeric.`826`
        #expect(us1 != gb)
    }

    @Test
    func `Numeric: Codable round-trip`() throws {
        let original = ISO_3166.Numeric.`840`
        let encoder = JSONEncoder()
        let data = try encoder.encode(original)
        let decoder = JSONDecoder()
        let decoded = try decoder.decode(ISO_3166.Numeric.self, from: data)
        #expect(decoded == original)
        #expect(decoded.value == "840")
    }

    // MARK: - CaseIterable Tests

    @Test
    func `CaseIterable: Alpha2 has all 249 codes`() {
        #expect(ISO_3166.Alpha2.allCases.count == 249)
        #expect(ISO_3166.Alpha2.allCases.contains(.us))
        #expect(ISO_3166.Alpha2.allCases.contains(.gb))
    }

    @Test
    func `CaseIterable: Alpha3 has all 249 codes`() {
        #expect(ISO_3166.Alpha3.allCases.count == 249)
        #expect(ISO_3166.Alpha3.allCases.contains(.usa))
        #expect(ISO_3166.Alpha3.allCases.contains(.gbr))
    }

    @Test
    func `CaseIterable: Numeric has all 249 codes`() {
        #expect(ISO_3166.Numeric.allCases.count == 249)
        #expect(ISO_3166.Numeric.allCases.contains(.`840`))
        #expect(ISO_3166.Numeric.allCases.contains(.`826`))
    }
}

// MARK: - Edge Case

extension ISO_3166.Tests.`Edge Case` {

    @Test
    func `ISO 3166: Edge case countries`() throws {
        // Antarctica
        let aq = try ISO_3166.Alpha2("aq")
        let ata = ISO_3166.Alpha3(aq)
        #expect(ata.value == "ata")

        // Vatican City
        let va = try ISO_3166.Alpha2("va")
        let vat = ISO_3166.Alpha3(va)
        #expect(vat.value == "vat")
    }
}

// MARK: - Integration

extension ISO_3166.Tests.Integration {

    // MARK: - Conversion Tests

    @Test
    func `Conversion: Alpha2 to Alpha3 (total function)`() {
        let us = ISO_3166.Alpha2.us
        let usa = ISO_3166.Alpha3(us)
        #expect(usa.value == "usa")

        let gb = ISO_3166.Alpha2.gb
        let gbr = ISO_3166.Alpha3(gb)
        #expect(gbr.value == "gbr")
    }

    @Test
    func `Conversion: Alpha3 to Alpha2 (total function)`() {
        let usa = ISO_3166.Alpha3.usa
        let us = ISO_3166.Alpha2(usa)
        #expect(us.value == "us")

        let gbr = ISO_3166.Alpha3.gbr
        let gb = ISO_3166.Alpha2(gbr)
        #expect(gb.value == "gb")
    }

    @Test
    func `Conversion: Alpha2 to Numeric (total function)`() {
        let us = ISO_3166.Alpha2.us
        let num840 = ISO_3166.Numeric(us)
        #expect(num840.value == "840")

        let gb = ISO_3166.Alpha2.gb
        let num826 = ISO_3166.Numeric(gb)
        #expect(num826.value == "826")
    }

    @Test
    func `Conversion: Numeric to Alpha2 (total function)`() {
        let num840 = ISO_3166.Numeric.`840`
        let us = ISO_3166.Alpha2(num840)
        #expect(us.value == "us")

        let num826 = ISO_3166.Numeric.`826`
        let gb = ISO_3166.Alpha2(num826)
        #expect(gb.value == "gb")
    }

    @Test
    func `Conversion: Round-trip Alpha2 → Alpha3 → Alpha2`() {
        let original = ISO_3166.Alpha2.us
        let alpha3 = ISO_3166.Alpha3(original)
        let roundtrip = ISO_3166.Alpha2(alpha3)
        #expect(roundtrip == original)
    }

    @Test
    func `Conversion: Round-trip Alpha2 → Numeric → Alpha2`() {
        let original = ISO_3166.Alpha2.us
        let numeric = ISO_3166.Numeric(original)
        let roundtrip = ISO_3166.Alpha2(numeric)
        #expect(roundtrip == original)
    }

    // MARK: - Specific Countries

    @Test
    func `ISO 3166: Major countries`() throws {
        // United States
        let us = try ISO_3166.Alpha2("us")
        let usa = ISO_3166.Alpha3(us)
        let us840 = ISO_3166.Numeric(us)
        #expect(usa.value == "usa")
        #expect(us840.value == "840")

        // United Kingdom
        let gb = try ISO_3166.Alpha2("gb")
        let gbr = ISO_3166.Alpha3(gb)
        let gb826 = ISO_3166.Numeric(gb)
        #expect(gbr.value == "gbr")
        #expect(gb826.value == "826")

        // Japan
        let jp = try ISO_3166.Alpha2("jp")
        let jpn = ISO_3166.Alpha3(jp)
        let jp392 = ISO_3166.Numeric(jp)
        #expect(jpn.value == "jpn")
        #expect(jp392.value == "392")

        // Germany
        let de = try ISO_3166.Alpha2("de")
        let deu = ISO_3166.Alpha3(de)
        let de276 = ISO_3166.Numeric(de)
        #expect(deu.value == "deu")
        #expect(de276.value == "276")
    }

    // MARK: - Code Tests (All Formats)

    @Test
    func `Code: Create from alpha-2`() throws {
        let us = try ISO_3166.Code("US")
        #expect(us.description == "us")

        if case .alpha2(let alpha2) = us {
            #expect(alpha2.value == "us")
        } else {
            Issue.record("Expected alpha2 case")
        }
    }

    @Test
    func `Code: Create from alpha-3`() throws {
        let usa = try ISO_3166.Code("USA")
        #expect(usa.description == "usa")

        if case .alpha3(let alpha3) = usa {
            #expect(alpha3.value == "usa")
        } else {
            Issue.record("Expected alpha3 case")
        }
    }

    @Test
    func `Code: Create from numeric`() throws {
        let us840 = try ISO_3166.Code("840")
        #expect(us840.description == "840")

        if case .numeric(let numeric) = us840 {
            #expect(numeric.value == "840")
        } else {
            Issue.record("Expected numeric case")
        }
    }

    @Test
    func `Code: All three formats for same country`() throws {
        let us1 = try ISO_3166.Code("US")
        let us2 = try ISO_3166.Code("USA")
        let us3 = try ISO_3166.Code("840")

        // All represent United States
        #expect(us1.description == "us")
        #expect(us2.description == "usa")
        #expect(us3.description == "840")
    }

    @Test
    func `Code: Direct initialization`() {
        let us1 = ISO_3166.Code.alpha2(ISO_3166.Alpha2.us)
        let us2 = ISO_3166.Code.alpha3(ISO_3166.Alpha3.usa)
        let us3 = ISO_3166.Code.numeric(ISO_3166.Numeric.`840`)

        #expect(us1.description == "us")
        #expect(us2.description == "usa")
        #expect(us3.description == "840")
    }

    @Test
    func `Code: Equality`() throws {
        let us1 = try ISO_3166.Code("US")
        let us2 = try ISO_3166.Code("US")
        #expect(us1 == us2)

        let usa = try ISO_3166.Code("USA")
        #expect(us1 != usa)  // Different cases are not equal

        let gb = try ISO_3166.Code("GB")
        #expect(us1 != gb)
    }

    @Test
    func `Code: Codable round-trip all formats`() throws {
        let encoder = JSONEncoder()
        let decoder = JSONDecoder()

        // Alpha-2
        let us = try ISO_3166.Code("US")
        let usData = try encoder.encode(us)
        let usDecoded = try decoder.decode(ISO_3166.Code.self, from: usData)
        #expect(usDecoded == us)

        // Alpha-3
        let usa = try ISO_3166.Code("USA")
        let usaData = try encoder.encode(usa)
        let usaDecoded = try decoder.decode(ISO_3166.Code.self, from: usaData)
        #expect(usaDecoded == usa)

        // Numeric
        let us840 = try ISO_3166.Code("840")
        let us840Data = try encoder.encode(us840)
        let us840Decoded = try decoder.decode(ISO_3166.Code.self, from: us840Data)
        #expect(us840Decoded == us840)
    }

    @Test
    func `Code: Invalid code throws`() {
        #expect(throws: ISO_3166.Error.invalidAlpha2Code("zz")) {
            try ISO_3166.Code("ZZ")
        }

        #expect(throws: ISO_3166.Error.invalidAlpha3Code("zzz")) {
            try ISO_3166.Code("ZZZ")
        }

        #expect(throws: ISO_3166.Error.invalidNumericCode("000")) {
            try ISO_3166.Code("000")
        }
    }
}
