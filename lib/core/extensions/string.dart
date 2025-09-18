extension StringExtension on String {
  String get toTitleCase => this[0].toUpperCase() + substring(1);
}
