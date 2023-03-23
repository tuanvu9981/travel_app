import 'package:shared_preferences/shared_preferences.dart';

class StorageApi {
  final String accessToken = 'accessToken';
  final String refreshToken = 'refreshToken';

  Future<void> setAccessToken(String accessToken) async {
    final preference = await SharedPreferences.getInstance();
    await preference.setString(accessToken, accessToken);
  }

  Future<String?> getAccessToken() async {
    final preference = await SharedPreferences.getInstance();
    return preference.getString(accessToken);
  }

  Future<void> setRefreshToken(String refreshToken) async {
    final preference = await SharedPreferences.getInstance();
    await preference.setString(refreshToken, refreshToken);
  }

  Future<String?> getRefreshToken() async {
    final preference = await SharedPreferences.getInstance();
    return preference.getString(refreshToken);
  }
}
