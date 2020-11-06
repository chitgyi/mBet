extension StringExtension on String {
  String concat(String path) {
    return "${this}$path";
  }
}
