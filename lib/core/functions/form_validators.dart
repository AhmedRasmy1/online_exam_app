String? validateNotEmpty(String? value, String message) {
  if (value == null || value.isEmpty) {
    return message;
  }
  return null;
}
