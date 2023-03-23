import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:travel_app/apis/auth.api.dart';
import 'package:travel_app/router.dart';

void main() {
  runApp(const ProviderScope(child: TravelApp()));
}

class TravelApp extends ConsumerStatefulWidget {
  const TravelApp({Key? key}) : super(key: key);

  @override
  TravelAppState createState() => TravelAppState();
}

class TravelAppState extends ConsumerState<TravelApp> {
  Future<void> getUserData() async {
    final user = await ref.read(authProvider).getProfile();
    if (user != null) {
      ref.read(userProvider.notifier).update((state) => user);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Travel App',
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
        final user = ref.watch(userProvider);
        return user != null ? loggedInRoute : loggedOutRoute;
      })),
      routeInformationParser: const RoutemasterParser(),
    );
  }
}
