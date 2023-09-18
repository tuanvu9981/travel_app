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
    LanguageI18(
        languageCode: 'vi',
        languageAppLocal: 'vietnamese',
        flagImageUrl: 'assets/images/vietnam_flag.png'),
    LanguageI18(
        languageCode: 'en',
        languageAppLocal: 'english',
        flagImageUrl: 'assets/images/usa_flag.png'),
    LanguageI18(
        languageCode: 'ja',
        languageAppLocal: 'japanese',
        flagImageUrl: 'assets/images/japan_flag.png'),
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
                  (e) => Container(
                    height: 75.0,
                    margin: const EdgeInsets.all(12.0),
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0.0, 2.0),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Image.asset(e.flagImageUrl!, height: 60.0),
                        ),
                        const SizedBox(width: 10.0),
                        Expanded(
                          flex: 5,
                          child: Text(
                            AppLocalizations.of(context)!.languageName(
                              e.languageCode!,
                            ),
                            style: txtStyle,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Radio<String>(
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
                      ],
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
