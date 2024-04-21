import 'dart:convert';

import 'package:office_app/features/application/core/user_client.dart';
import 'package:office_app/features/application/current_user/models/current_user.dart';

class CurrentUserRepository {
  Future<CurrentUser?> getCurrentUser(Map<String, String> headers) async {
    UserClient client = UserClient();

    try {
      final response = await client.getCurrentUserMeasurements(headers);

      final Map<String, dynamic> body = jsonDecode(response.body);

      //TODO polacz te dwie rzeczy

      return CurrentUser.fromJson(body);
    } catch (e) {
      print("Exception! $e");
      return null;
    }
  }
}
