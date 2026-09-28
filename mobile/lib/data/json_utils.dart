import 'dart:convert';

/// Thin wrappers so table definitions don't each import dart:convert.
dynamic jsonDecodeSafe(String source) => json.decode(source);

String jsonEncodeSafe(Object? value) => json.encode(value);
