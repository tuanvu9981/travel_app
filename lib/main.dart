import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:travel_app/apis/auth.api.dart';
import 'package:travel_app/apis/language.api.dart';
import 'package:travel_app/models/user.model.dart';
import 'package:travel_app/router.dart';
import 'package:riverpod/riverpod.dart';

void main() {
  runApp(const ProviderScope(child: TravelApp()));
}

class TravelApp extends ConsumerStatefulWidget {
  const TravelApp({Key? key}) : super(key: key);

  static void setLocale(BuildContext context, Locale newLocale) {
    TravelAppState? state = context.findAncestorStateOfType<TravelAppState>();
    state?.updateLocale(newLocale);
  }

  @override
  TravelAppState createState() => TravelAppState();
}

class TravelAppState extends ConsumerState<TravelApp> {
  Locale? _locale;

  void updateLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  Future<void> getUserData() async {
    final user = await ref.read(authProvider).getProfile();
    if (user != null) {
      ref.read(userProvider.notifier).update((state) => user);
    }
    updateLocale(Locale(user?.systemLanguage ?? 'en'));
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);

    return MaterialApp.router(
      title: 'Travel App',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,
      theme: ThemeData(
        primaryColor: const Color(0xFF3EBACE),
        scaffoldBackgroundColor: const Color(0xFFF3F5F7),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFFD8ECF1),
        ),
        primaryColorLight: Colors.lightBlue.shade300,
        // colorScheme secondary is equivalent to accentColor
      ),
      routerDelegate: RoutemasterDelegate(routesBuilder: ((context) {
        return user != null ? loggedInRoute : loggedOutRoute;
      })),
      routeInformationParser: const RoutemasterParser(),
    );
  }
}
