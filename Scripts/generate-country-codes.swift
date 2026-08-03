#!/usr/bin/env swift
import Foundation

// MARK: - Data Structures

struct Country: Codable {
    let alpha2: String
    let alpha3: String
    let numeric: String
    let name: String
}

// MARK: - Swift Keywords

// NOTE: Keep in sync with Set<String>.swiftKeywords in Standards package
let swiftKeywords: Set<String> = [
    "as", "break", "case", "catch", "class", "continue", "default", "defer",
    "do", "else", "enum", "extension", "fallthrough", "false", "fileprivate",
    "for", "func", "guard", "if", "import", "in", "init", "inout", "internal",
    "is", "let", "nil", "operator", "private", "protocol", "public", "repeat",
    "return", "self", "Self", "static", "struct", "subscript", "super", "switch",
    "throw", "throws", "true", "try", "typealias", "var", "where", "while",
]

/// Escapes a code if it's a Swift keyword
func escapeIfNeeded(_ code: String) -> String {
    swiftKeywords.contains(code.lowercased()) ? "`\(code)`" : code
}

// MARK: - Script Errors

/// This single-file script already declares `Country` as its one type
/// ([API-IMPL-005] permits exactly one); conforming `String` to `Error`
/// via extension (not a new type declaration) gives every throwing helper
/// below a concrete, named error type to satisfy [API-ERR-001] without
/// adding a second nominal type to this file.
extension Swift.String: Swift.Error {}

// MARK: - Load Data

func loadCountries() throws(Swift.String) -> [Country] {
    let resourcesPath = "Sources/ISO 3166/Resources/iso-3166-1.json"
    // swift-linter:disable:next do throws for typed catch
    // REASON: callee is untyped-throwing — `Data(contentsOf:)` and
    // `JSONDecoder.decode` are Foundation APIs declared bare `throws`
    // with no typed-throws variant to preserve.
    do {
        let data = try Data(contentsOf: URL(fileURLWithPath: resourcesPath))
        return try JSONDecoder().decode([Country].self, from: data)
    } catch {
        throw "Failed to load countries from \(resourcesPath): \(error)"
    }
}

/// Writes `content` to `file`, wrapping `String.write(toFile:atomically:encoding:)`'s
/// untyped Foundation error into a typed `String` message so every call
/// site downstream stays on typed throws.
func write(_ content: String, toFile file: String) throws(Swift.String) {
    // swift-linter:disable:next do throws for typed catch
    // REASON: callee is untyped-throwing — `String.write(toFile:atomically:encoding:)`
    // is a Foundation API declared bare `throws` with no typed-throws variant.
    do {
        try content.write(toFile: file, atomically: true, encoding: .utf8)
    } catch {
        throw "Failed to write \(file): \(error)"
    }
}

// MARK: - Code Generation

func generateCountryCodes(countries: [Country]) -> String {
    var output = """
        // ISO_3166.CountryCodes.swift
        // ISO 3166
        //
        // Country code data and mappings
        //
        // ⚠️ AUTO-GENERATED FILE - DO NOT EDIT DIRECTLY
        // Generated from JSON data files using Scripts/generate-country-codes.swift
        // To update: modify JSON files in Resources/ then run: swift Scripts/generate-country-codes.swift

        import Standards

        extension ISO_3166 {
            /// Mapping from ISO 3166-1 alpha-2 (2-letter) to alpha-3 (3-letter) codes
            ///
            /// Complete ISO 3166-1 standard (249 codes) with their alpha-3 equivalents.
            ///
            /// ## Data Source
            /// Generated from authoritative UN Statistics Division ISO 3166-1 data.
            internal static let alpha2ToAlpha3: [Alpha2: Alpha3] = [

        """

    for country in countries.sorted(by: { $0.alpha2 < $1.alpha2 }) {
        let alpha2Escaped = escapeIfNeeded(country.alpha2.lowercased())
        let alpha3Escaped = escapeIfNeeded(country.alpha3.lowercased())
        output += "        .\(alpha2Escaped): .\(alpha3Escaped),  // \(country.name)\n"
    }

    output += """
            ]

            /// Mapping from ISO 3166-1 alpha-3 (3-letter) to alpha-2 (2-letter) codes
            internal static let alpha3ToAlpha2: [Alpha3: Alpha2] = {
                Dictionary(uniqueKeysWithValues: alpha2ToAlpha3.map { ($1, $0) })
            }()

            /// Mapping from ISO 3166-1 alpha-2 (2-letter) to numeric codes
            internal static let alpha2ToNumeric: [Alpha2: Numeric] = [

        """

    for country in countries.sorted(by: { $0.alpha2 < $1.alpha2 }) {
        let alpha2Escaped = escapeIfNeeded(country.alpha2.lowercased())
        output += "        .\(alpha2Escaped): .`\(country.numeric)`,  // \(country.name)\n"
    }

    output += """
            ]

            /// Mapping from ISO 3166-1 numeric to alpha-2 (2-letter) codes
            internal static let numericToAlpha2: [Numeric: Alpha2] = {
                Dictionary(uniqueKeysWithValues: alpha2ToNumeric.map { ($1, $0) })
            }()
        }

        """

    return output
}

func generateAlpha2StaticAccessors(countries: [Country]) -> String {
    var output = """
        // ISO_3166.Alpha2+StaticAccessors.swift
        // ISO 3166
        //
        // Static accessors for all ISO 3166-1 alpha-2 (2-letter) country codes
        //
        // ⚠️ AUTO-GENERATED FILE - DO NOT EDIT DIRECTLY
        // Generated from JSON data files using Scripts/generate-country-codes.swift
        // To update: modify JSON files in Resources/ then run: swift Scripts/generate-country-codes.swift

        extension ISO_3166.Alpha2 {

        """

    for country in countries.sorted(by: { $0.alpha2 < $1.alpha2 }) {
        let codeEscaped = escapeIfNeeded(country.alpha2.lowercased())
        output += "    /// \(country.name)\n"
        output +=
            "    public static let \(codeEscaped) = ISO_3166.Alpha2(unchecked: \"\(country.alpha2.lowercased())\")\n\n"
    }

    output += "}\n"
    return output
}

func generateAlpha3StaticAccessors(countries: [Country]) -> String {
    var output = """
        // ISO_3166.Alpha3+StaticAccessors.swift
        // ISO 3166
        //
        // Static accessors for all ISO 3166-1 alpha-3 (3-letter) country codes
        //
        // ⚠️ AUTO-GENERATED FILE - DO NOT EDIT DIRECTLY
        // Generated from JSON data files using Scripts/generate-country-codes.swift
        // To update: modify JSON files in Resources/ then run: swift Scripts/generate-country-codes.swift

        extension ISO_3166.Alpha3 {

        """

    for country in countries.sorted(by: { $0.alpha3 < $1.alpha3 }) {
        let codeEscaped = escapeIfNeeded(country.alpha3.lowercased())
        output += "    /// \(country.name)\n"
        output +=
            "    public static let \(codeEscaped) = ISO_3166.Alpha3(unchecked: \"\(country.alpha3.lowercased())\")\n\n"
    }

    output += "}\n"
    return output
}

func generateNumericStaticAccessors(countries: [Country]) -> String {
    var output = """
        // ISO_3166.Numeric+StaticAccessors.swift
        // ISO 3166
        //
        // Static accessors for all ISO 3166-1 numeric country codes
        //
        // ⚠️ AUTO-GENERATED FILE - DO NOT EDIT DIRECTLY
        // Generated from JSON data files using Scripts/generate-country-codes.swift
        // To update: modify JSON files in Resources/ then run: swift Scripts/generate-country-codes.swift

        extension ISO_3166.Numeric {

        """

    for country in countries.sorted(by: { $0.numeric < $1.numeric }) {
        // Use backticks for numeric constants (Swift 6.2+)
        output += "    /// \(country.name)\n"
        output +=
            "    public static let `\(country.numeric)` = ISO_3166.Numeric(unchecked: \"\(country.numeric)\")\n\n"
    }

    output += "}\n"
    return output
}

func generateAlpha2CaseIterable(countries: [Country]) -> String {
    var output = """
        // ISO_3166.Alpha2+CaseIterable.swift
        // ISO 3166
        //
        // CaseIterable conformance for ISO 3166-1 alpha-2 (2-letter) codes
        //
        // ⚠️ AUTO-GENERATED FILE - DO NOT EDIT DIRECTLY
        // Generated from JSON data files using Scripts/generate-country-codes.swift
        // To update: modify JSON files in Resources/ then run: swift Scripts/generate-country-codes.swift

        extension ISO_3166.Alpha2: CaseIterable {
            public static let allCases: [ISO_3166.Alpha2] = [

        """

    let sortedCountries = countries.sorted(by: { $0.alpha2 < $1.alpha2 })
    for (offset, country) in sortedCountries.enumerated() {
        let codeEscaped = escapeIfNeeded(country.alpha2.lowercased())
        let comma = offset == sortedCountries.indices.last ? "" : ","
        output += "        .\(codeEscaped)\(comma)\n"
    }

    output += """
            ]
        }

        """
    return output
}

func generateAlpha3CaseIterable(countries: [Country]) -> String {
    var output = """
        // ISO_3166.Alpha3+CaseIterable.swift
        // ISO 3166
        //
        // CaseIterable conformance for ISO 3166-1 alpha-3 (3-letter) codes
        //
        // ⚠️ AUTO-GENERATED FILE - DO NOT EDIT DIRECTLY
        // Generated from JSON data files using Scripts/generate-country-codes.swift
        // To update: modify JSON files in Resources/ then run: swift Scripts/generate-country-codes.swift

        extension ISO_3166.Alpha3: CaseIterable {
            public static let allCases: [ISO_3166.Alpha3] = [

        """

    let sortedCountries = countries.sorted(by: { $0.alpha3 < $1.alpha3 })
    for (offset, country) in sortedCountries.enumerated() {
        let codeEscaped = escapeIfNeeded(country.alpha3.lowercased())
        let comma = offset == sortedCountries.indices.last ? "" : ","
        output += "        .\(codeEscaped)\(comma)\n"
    }

    output += """
            ]
        }

        """
    return output
}

func generateNumericCaseIterable(countries: [Country]) -> String {
    var output = """
        // ISO_3166.Numeric+CaseIterable.swift
        // ISO 3166
        //
        // CaseIterable conformance for ISO 3166-1 numeric codes
        //
        // ⚠️ AUTO-GENERATED FILE - DO NOT EDIT DIRECTLY
        // Generated from JSON data files using Scripts/generate-country-codes.swift
        // To update: modify JSON files in Resources/ then run: swift Scripts/generate-country-codes.swift

        extension ISO_3166.Numeric: CaseIterable {
            public static let allCases: [ISO_3166.Numeric] = [

        """

    let sortedCountries = countries.sorted(by: { $0.numeric < $1.numeric })
    for (offset, country) in sortedCountries.enumerated() {
        let comma = offset == sortedCountries.indices.last ? "" : ","
        output += "        .`\(country.numeric)`\(comma)\n"
    }

    output += """
            ]
        }

        """
    return output
}

// MARK: - Main

do throws(Swift.String) {
    print("Loading country codes...")
    let countries = try loadCountries()
    print("Loaded \(countries.count) countries")

    let generatedDir = "Sources/ISO 3166/Generated"

    print("Generating code files...")

    // Generate mappings
    let countryCodes = generateCountryCodes(countries: countries)
    try write(countryCodes, toFile: "\(generatedDir)/ISO_3166.CountryCodes.swift")
    print("✓ Generated ISO_3166.CountryCodes.swift")

    // Generate static accessors
    let alpha2Accessors = generateAlpha2StaticAccessors(countries: countries)
    try write(alpha2Accessors, toFile: "\(generatedDir)/ISO_3166.Alpha2+StaticAccessors.swift")
    print("✓ Generated ISO_3166.Alpha2+StaticAccessors.swift")

    let alpha3Accessors = generateAlpha3StaticAccessors(countries: countries)
    try write(alpha3Accessors, toFile: "\(generatedDir)/ISO_3166.Alpha3+StaticAccessors.swift")
    print("✓ Generated ISO_3166.Alpha3+StaticAccessors.swift")

    let numericAccessors = generateNumericStaticAccessors(countries: countries)
    try write(numericAccessors, toFile: "\(generatedDir)/ISO_3166.Numeric+StaticAccessors.swift")
    print("✓ Generated ISO_3166.Numeric+StaticAccessors.swift")

    // Generate CaseIterable conformances
    let alpha2CaseIterable = generateAlpha2CaseIterable(countries: countries)
    try write(alpha2CaseIterable, toFile: "\(generatedDir)/ISO_3166.Alpha2+CaseIterable.swift")
    print("✓ Generated ISO_3166.Alpha2+CaseIterable.swift")

    let alpha3CaseIterable = generateAlpha3CaseIterable(countries: countries)
    try write(alpha3CaseIterable, toFile: "\(generatedDir)/ISO_3166.Alpha3+CaseIterable.swift")
    print("✓ Generated ISO_3166.Alpha3+CaseIterable.swift")

    let numericCaseIterable = generateNumericCaseIterable(countries: countries)
    try write(numericCaseIterable, toFile: "\(generatedDir)/ISO_3166.Numeric+CaseIterable.swift")
    print("✓ Generated ISO_3166.Numeric+CaseIterable.swift")

    print("\n✅ Code generation complete!")
    print("Generated 7 files for \(countries.count) countries")

} catch {
    print("❌ Error: \(error)")
    exit(1)
}
