# swift-iso-3166

Type-safe Swift implementation of ISO 3166-1 country codes.

## Overview

ISO 3166-1 defines codes for countries, territories, and areas of geographical interest. This package provides type-safe Swift types for all three code formats:

- **Alpha-2**: 2-letter codes (US, GB, JP)
- **Alpha-3**: 3-letter codes (USA, GBR, JPN)
- **Numeric**: 3-digit codes (840, 826, 392)

## Features

- ✅ **Complete coverage**: All 249 ISO 3166-1 codes
- ✅ **Type-safe**: Refined types prevent invalid codes at compile time
- ✅ **Validated**: Runtime validation with descriptive errors
- ✅ **Conversions**: Bidirectional conversions between all formats
- ✅ **Performance**: O(1) lookups via hash tables
- ✅ **Codable**: JSON encoding/decoding support
- ✅ **CaseIterable**: Access all valid codes via `.allCases`
- ✅ **Static accessors**: Convenient access like `.us`, `.gbr`, `` .`840` ``

## Installation

Add this package as a dependency in your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/swift-iso/swift-iso-3166", from: "0.2.4")
]
```

## Usage

### Creating Country Codes

```swift
import ISO_3166

// From strings (validated)
let us = try ISO_3166.Alpha2("us")        // United States
let usa = try ISO_3166.Alpha3("usa")      // United States
let num840 = try ISO_3166.Numeric("840")  // United States

// Using static accessors (type-safe)
let gb = ISO_3166.Alpha2.gb          // United Kingdom
let gbr = ISO_3166.Alpha3.gbr        // United Kingdom
let num826 = ISO_3166.Numeric.`826`  // United Kingdom

// Case normalization
let jp = try ISO_3166.Alpha2("JP")  // Normalized to "jp"
```

### Conversions

All conversions are total functions (never fail):

```swift
// Alpha-2 ↔ Alpha-3
let us = ISO_3166.Alpha2.us
let usa = ISO_3166.Alpha3(us)  // "usa"
let usBack = ISO_3166.Alpha2(usa)  // "us"

// Alpha-2 ↔ Numeric
let num = ISO_3166.Numeric(us)  // "840"
let usFromNum = ISO_3166.Alpha2(num)  // "us"
```

### Validation

Codes are validated at initialization:

```swift
do {
    let invalid = try ISO_3166.Alpha2("zz")
} catch ISO_3166.Alpha2.Error.invalidAlpha2Code(let code) {
    print("Invalid code: \(code)")
}

// Validation checks:
// - Correct length (2 for Alpha2, 3 for Alpha3/Numeric)
// - ASCII letters only (Alpha2/Alpha3) or digits only (Numeric)
// - Recognized ISO 3166-1 code
```

### Iterating All Codes

```swift
// All alpha-2 codes
for code in ISO_3166.Alpha2.allCases {
    print(code.value)
}

// All alpha-3 codes
for code in ISO_3166.Alpha3.allCases {
    print(code.value)
}

// All numeric codes
for code in ISO_3166.Numeric.allCases {
    print(code.value)
}
```

### Codable Support

```swift
struct Location: Codable {
    let country: ISO_3166.Alpha2
}

let location = Location(country: .us)
let data = try JSONEncoder().encode(location)
// {"country":"us"}

let decoded = try JSONDecoder().decode(Location.self, from: data)
```

## Examples

### Common Countries

```swift
// Major economies
ISO_3166.Alpha2.us  // United States
ISO_3166.Alpha2.cn  // China
ISO_3166.Alpha2.jp  // Japan
ISO_3166.Alpha2.de  // Germany
ISO_3166.Alpha2.gb  // United Kingdom
ISO_3166.Alpha2.fr  // France
ISO_3166.Alpha2.in  // India
ISO_3166.Alpha2.ca  // Canada
ISO_3166.Alpha2.au  // Australia
```

### Country Code Lookup

```swift
func lookupCountry(_ code: String) -> String? {
    guard let alpha2 = try? ISO_3166.Alpha2(code) else {
        return nil
    }
    let alpha3 = ISO_3166.Alpha3(alpha2)
    let numeric = ISO_3166.Numeric(alpha2)
    return "\(alpha2) = \(alpha3) = \(numeric)"
}

print(lookupCountry("us")!)  // "us = usa = 840"
print(lookupCountry("jp")!)  // "jp = jpn = 392"
```

## Design Principles

### Refined Type Pattern

This implementation follows the refined type pattern:
- **String-based storage**: Codes stored as validated strings
- **Type-safe conversions**: Compiler-enforced valid transformations
- **Single source of truth**: Generated from authoritative UN data
- **No duplication**: Code generation from JSON eliminates repetition

### Performance

- **O(1) lookups**: Hash table-based dictionaries
- **O(1) conversions**: All conversions use pre-computed dictionaries
- **Minimal memory**: Static let accessors share underlying storage

### Code Generation

All 249 country codes are generated from JSON data files:
- `Resources/iso-3166-1.json`: Authoritative UN Statistics Division data
- `Scripts/generate-country-codes.swift`: Code generator
- `Generated/*.swift`: Auto-generated files (do not edit directly)

To regenerate:

```bash
swift Scripts/generate-country-codes.swift
```

## Data Source

Country codes are sourced from the United Nations Statistics Division, which maintains the official ISO 3166-1 standard. The data includes all 249 officially assigned codes.

## Requirements

- Swift 6.0+
- macOS 15+, iOS 18+, tvOS 18+, watchOS 11+

## Dependencies

- [swift-standards](https://github.com/swift-standards/swift-standards): Common standards utilities
- [swift-incits-4-1986](https://github.com/swift-incits/swift-incits-4-1986): ASCII character classification

## License

This package implements the ISO 3166-1 standard. The ISO 3166-1 codes are available for internal use and non-commercial purposes free of charge.

## Related Standards

- [ISO 639](https://github.com/swift-iso/swift-iso-639): Language codes
- [ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2): Country subdivision codes
- [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217): Currency codes

## References

- [ISO 3166-1 on Wikipedia](https://en.wikipedia.org/wiki/ISO_3166-1)
- [UN Statistics Division](https://unstats.un.org/unsd/methodology/m49/)
- [ISO Online Browsing Platform](https://www.iso.org/obp/ui/)
