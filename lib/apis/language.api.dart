import 'package:shared_preferences/shared_preferences.dart';

class LanguageApi {
  final String languageCode = 'languageCode';

  Future<void> setLanguageCode(String newCode) async {
    final preference = await SharedPreferences.getInstance();
    await preference.setString(languageCode, newCode);
  }

  Future<String?> getLanguageCode() async {
    final preference = await SharedPreferences.getInstance();
    return preference.getString(languageCode);
  }

  Future<void> removeLanguageCode() async {
    final preference = await SharedPreferences.getInstance();
    await preference.remove(languageCode);
  }
}
