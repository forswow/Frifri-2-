extension StringCaptialize on String {
  String captialize() =>
      '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
}
