import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<Map<String, dynamic>> loadLocaleMap() async {
  var localeMap = <String, dynamic>{};
  for (var locale in AppLocalizations.supportedLocales) {
    var lang = locale.toLanguageTag().replaceAll('-', '_');
    var fileName = "app_$lang.arb";

    // Needs import 'package:flutter/services.dart';
    await rootBundle.loadString("lib/l10n/$fileName").then((file) {
      var data = jsonDecode(file);
      localeMap[lang] = <String, String>{};

      data.forEach((key, value) {
        if (value is String && key is String) {
          if (!value.contains("{") && !key.contains("@")) {
            localeMap[lang]![key] = value;
          }
        }
      });
    });
  }
  return localeMap;
}
