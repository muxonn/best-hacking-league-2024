class UserClientPath {
  static Uri ranking(int month) {
    return Uri.parse("http://192.168.86.176/stats/ranking?month=$month");
  }

  static Uri time() {
    return Uri.parse("http://192.168.86.176/stats/time");
  }
}
