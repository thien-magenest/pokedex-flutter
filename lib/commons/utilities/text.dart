class TextUtils {
  static String capitalize(String? str) {
    return (str ?? '')[0].toUpperCase() +
        (str ?? '').substring(1).toLowerCase();
  }
}
