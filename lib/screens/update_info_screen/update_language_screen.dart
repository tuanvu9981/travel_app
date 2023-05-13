import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_app/apis/auth.api.dart';
import 'package:travel_app/main.dart';
import 'package:travel_app/models/language.i18.model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../models/user.model.dart';

class UpdateLanguageScreen extends ConsumerStatefulWidget {
  const UpdateLanguageScreen({super.key});

  @override
  UpdateLanguageScreenState createState() => UpdateLanguageScreenState();
}

class UpdateLanguageScreenState extends ConsumerState<UpdateLanguageScreen> {
  final languageI18n = <LanguageI18>[
    LanguageI18(languageCode: 'vi', languageAppLocal: 'vietnamese'),
    LanguageI18(languageCode: 'en', languageAppLocal: 'english'),
    LanguageI18(languageCode: 'ja', languageAppLocal: 'japanese'),
  ];
  final txtStyle = const TextStyle(
    fontSize: 20.0,
    fontFamily: 'VNPro',
    fontWeight: FontWeight.bold,
  );

  // real: ref.user.currentLanguage (fetched from backend)
  String? _currentLanguage;

  Future<void> updateGeneral(
    User newUser,
    BuildContext context,
  ) async {
    final sMessenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    final result = await ref.read(authProvider).updateGeneral(newUser);
    if (result!.statusCode == 200) {
      navigator.pop(true);
    } else if (result.statusCode == 400) {
      sMessenger.showSnackBar(
        SnackBar(
          content: Text(result.message),
          duration: const Duration(seconds: 5),
        ),
      );
    }
  }

  @override
  void initState() {
    _currentLanguage = ref.read(userProvider)!.systemLanguage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final newUser = ref.read(userProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Update system language',
          style: TextStyle(
            fontSize: 16.5,
            fontFamily: 'VNPro',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColorLight,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 25.0),
            ...languageI18n
                .map(
                  (e) => ListTile(
                    title: Text(
                      AppLocalizations.of(context)!.languageName(
                        e.languageCode!,
                      ),
                      style: txtStyle,
                    ),
                    leading: Radio<String>(
                      activeColor: Theme.of(context).primaryColor,
                      value: e.languageCode!,
                      groupValue: _currentLanguage,
                      onChanged: (String? value) {
                        setState(() {
                          _currentLanguage = value;
                        });
                      },
                    ),
                  ),
                )
                .toList(),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 22.5),
                child: TextButton(
                  onPressed: () {
                    newUser.state!.systemLanguage = _currentLanguage;
                    updateGeneral(newUser.state!, context);
                  },
                  child: Text(
                    AppLocalizations.of(context)!.update,
                    style: const TextStyle(
                      color: Colors.lightBlue,
                      fontSize: 20.0,
                      fontFamily: 'VNPro',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
