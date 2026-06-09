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
    "throw", "throws", "true", "try", "typealias", "var", "where", "while"
]

/// Escapes a code if it's a Swift keyword
func escapeIfNeeded(_ code: String) -> String {
    swiftKeywords.contains(code.lowercased()) ? "`\(code)`" : code
}

// MARK: - Load Data

func loadCountries() throws -> [Country] {
    let resourcesPath = "Sources/ISO 3166/Data/iso-3166-1.json"
    let data = try Data(contentsOf: URL(fileURLWithPath: resourcesPath))
    return try JSONDecoder().decode([Country].self, from: data)
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
        output += "    public static let \(codeEscaped) = ISO_3166.Alpha2(unchecked: \"\(country.alpha2.lowercased())\")\n\n"
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
        output += "    public static let \(codeEscaped) = ISO_3166.Alpha3(unchecked: \"\(country.alpha3.lowercased())\")\n\n"
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
        output += "    public static let `\(country.numeric)` = ISO_3166.Numeric(unchecked: \"\(country.numeric)\")\n\n"
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
    for (index, country) in sortedCountries.enumerated() {
        let codeEscaped = escapeIfNeeded(country.alpha2.lowercased())
        let comma = index < sortedCountries.count - 1 ? "," : ""
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
    for (index, country) in sortedCountries.enumerated() {
        let codeEscaped = escapeIfNeeded(country.alpha3.lowercased())
        let comma = index < sortedCountries.count - 1 ? "," : ""
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
    for (index, country) in sortedCountries.enumerated() {
        let comma = index < sortedCountries.count - 1 ? "," : ""
        output += "        .`\(country.numeric)`\(comma)\n"
    }

    output += """
        ]
    }

    """
    return output
}

// MARK: - Main

do {
    print("Loading country codes...")
    let countries = try loadCountries()
    print("Loaded \(countries.count) countries")

    let generatedDir = "Sources/ISO 3166/Generated"

    print("Generating code files...")

    // Generate mappings
    let countryCodes = generateCountryCodes(countries: countries)
    try countryCodes.write(toFile: "\(generatedDir)/ISO_3166.CountryCodes.swift", atomically: true, encoding: .utf8)
    print("✓ Generated ISO_3166.CountryCodes.swift")

    // Generate static accessors
    let alpha2Accessors = generateAlpha2StaticAccessors(countries: countries)
    try alpha2Accessors.write(toFile: "\(generatedDir)/ISO_3166.Alpha2+StaticAccessors.swift", atomically: true, encoding: .utf8)
    print("✓ Generated ISO_3166.Alpha2+StaticAccessors.swift")

    let alpha3Accessors = generateAlpha3StaticAccessors(countries: countries)
    try alpha3Accessors.write(toFile: "\(generatedDir)/ISO_3166.Alpha3+StaticAccessors.swift", atomically: true, encoding: .utf8)
    print("✓ Generated ISO_3166.Alpha3+StaticAccessors.swift")

    let numericAccessors = generateNumericStaticAccessors(countries: countries)
    try numericAccessors.write(toFile: "\(generatedDir)/ISO_3166.Numeric+StaticAccessors.swift", atomically: true, encoding: .utf8)
    print("✓ Generated ISO_3166.Numeric+StaticAccessors.swift")

    // Generate CaseIterable conformances
    let alpha2CaseIterable = generateAlpha2CaseIterable(countries: countries)
    try alpha2CaseIterable.write(toFile: "\(generatedDir)/ISO_3166.Alpha2+CaseIterable.swift", atomically: true, encoding: .utf8)
    print("✓ Generated ISO_3166.Alpha2+CaseIterable.swift")

    let alpha3CaseIterable = generateAlpha3CaseIterable(countries: countries)
    try alpha3CaseIterable.write(toFile: "\(generatedDir)/ISO_3166.Alpha3+CaseIterable.swift", atomically: true, encoding: .utf8)
    print("✓ Generated ISO_3166.Alpha3+CaseIterable.swift")

    let numericCaseIterable = generateNumericCaseIterable(countries: countries)
    try numericCaseIterable.write(toFile: "\(generatedDir)/ISO_3166.Numeric+CaseIterable.swift", atomically: true, encoding: .utf8)
    print("✓ Generated ISO_3166.Numeric+CaseIterable.swift")

    print("\n✅ Code generation complete!")
    print("Generated 7 files for \(countries.count) countries")

} catch {
    print("❌ Error: \(error)")
    exit(1)
}
