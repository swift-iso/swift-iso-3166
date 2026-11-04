# swift-iso-3166

Use this package when you need to validate, store or convert ISO 3166-1 country codes. Start from `ISO_3166.Alpha2`, `ISO_3166.Alpha3` or `ISO_3166.Numeric` when you know which form you have, and from `ISO_3166.Code` when the input could be any of the three.

## Laws

- A code is valid only if it is one of the 249 officially assigned codes in the package's table. Any other code, such as the user-assigned `ZZ`, is refused.
- Letter codes are case-insensitive on input and always stored lowercase, so `US` and `us` give equal values and both print and encode as `us`.
- Input must be ASCII. A character that only lowercases to an ASCII letter, such as the Kelvin sign, is refused.
- A numeric code is exactly three ASCII digits and keeps its leading zeros, as in `004`.
- Converting between the three forms never fails and round-trips for every code: alpha-2 to alpha-3 and back, and alpha-2 to numeric and back.
- `ISO_3166.Code` chooses its form from the input: two characters are alpha-2, three letters are alpha-3, three digits are numeric. Three characters that mix letters and digits fail with `ISO_3166.Error.invalidCodeLength(_:)`.
- `ISO_3166.Code` values of different forms are never equal, even for the same country. Convert to one form before comparing.
- Every type encodes as a single string, its stored form, and decoding validates the string the same way the initializer does.
