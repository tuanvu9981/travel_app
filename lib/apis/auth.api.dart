import 'package:http/http.dart';
import 'package:travel_app/models/user.model.dart';
import 'api.const.dart';
import 'dart:convert';

class AuthApi {
  static String endpoint = 'auth';
  static Future<User?> getProfile(String token) async {
    var response = await get(
      Uri.http(ApiConst.baseUrl, "/api/v1/$endpoint/profile"),
      headers: {
        ...ApiConst.headers,
        "Authorization": "Bearer $token",
      },
    );
    if (response.statusCode == 200) {
      final mapData = jsonDecode(response.body)['data'];
      return User.fromJson(mapData);
    }
    return null;
  }
}
