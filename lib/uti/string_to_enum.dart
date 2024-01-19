// first enum value will be returned if no match is found
T enumFromString<T>(List<T> values, String? value) {
  if (value == null) {
    return values.first;
  }
  return values.firstWhere(
    (e) => e.toString().split('.').last.toLowerCase() == value.toLowerCase(),
    orElse: () => values.first,
  );
}

// returns empty string if value is null
String stringFromEnum(dynamic value) {
  return value?.toString().split('.').last ?? '';
}
