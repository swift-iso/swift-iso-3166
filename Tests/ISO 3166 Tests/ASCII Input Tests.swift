import Testing

@testable import ISO_3166

@Suite
struct `ASCII input` {
    @Test
    func `a Kelvin sign that lowercases to k is refused`() {
        #expect(throws: ISO_3166.Alpha2.Error.self) { try ISO_3166.Alpha2("S\u{212A}") }
        #expect(throws: ISO_3166.Alpha3.Error.self) { try ISO_3166.Alpha3("SV\u{212A}") }
        #expect(throws: ISO_3166.Error.self) { try ISO_3166.Code("\u{212A}R") }
    }

    @Test
    func `ASCII codes in any case still parse`() throws {
        _ = try ISO_3166.Alpha2("sk")
        _ = try ISO_3166.Alpha2("SK")
        _ = try ISO_3166.Alpha3("svk")
    }
}
