import 'dart:io';

List _nulls = [null, '', 'null', 0, {}, [], File(''), '[]'];

// Check if a value is considered "null-like."
// This function takes a value and checks if it matches any common representations of "null" or empty states
// (like null, empty string, the word "null", zero, empty map, or empty list).
bool isNullCheck(dynamic value) {
  return _nulls.contains(value);
}
