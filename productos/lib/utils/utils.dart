bool isNumeric(String value) {
  final isNumber = num.tryParse(value);
  return (isNumber != null);
}
