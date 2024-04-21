import 'dart:convert';

class BBHeader {
  static String username = "user";
  static String password = "password";

  static String basicAuth =
      'Basic ${base64Encode(utf8.encode('$username:$password'))}';
  static Map<String, String> headers = {
    'Authorization': basicAuth,
  };
}
