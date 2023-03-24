import 'package:shared_preferences/shared_preferences.dart';

class StorageApi {
  final String accessToken = 'accessToken';
  final String refreshToken = 'refreshToken';

  Future<void> setAccessToken(String apiAccessToken) async {
    final preference = await SharedPreferences.getInstance();
    await preference.setString(accessToken, apiAccessToken);
  }

  Future<String?> getAccessToken() async {
    final preference = await SharedPreferences.getInstance();
    return preference.getString(accessToken);
  }

  Future<void> setRefreshToken(String apiRefreshToken) async {
    final preference = await SharedPreferences.getInstance();
    await preference.setString(refreshToken, apiRefreshToken);
  }

  Future<String?> getRefreshToken() async {
    final preference = await SharedPreferences.getInstance();
    return preference.getString(refreshToken);
  }

  Future<void> removeTokens() async {
    final preference = await SharedPreferences.getInstance();
    await preference.remove(accessToken);
    await preference.remove(refreshToken);
  }
}
