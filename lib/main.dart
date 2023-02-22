import 'package:flutter/material.dart';
import 'package:travel_app/screens/destination_all_list/destination_all_list.dart';
import 'package:travel_app/screens/home.screen.dart';

import 'package:travel_app/screens/authentication/sign_in.screen.dart';
import 'package:travel_app/screens/authentication/sign_up.screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0xFF3EBACE),
        scaffoldBackgroundColor: const Color(0xFFF3F5F7),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFFD8ECF1),
        ),
        primaryColorLight: Colors.lightBlue.shade300,
        // colorScheme secondary is equivalent to accentColor
      ),
      // onGenerateRoute: (RouteSettings settings) => {

      // },
      home: HomeScreen(),
      // home: const SignUpScreen(),
      // home: const SignInScreen(),

      routes: {
        '/sign-in': (context) => const SignInScreen(),
        '/sign-up': (context) => const SignUpScreen(),
        '/home': (context) => HomeScreen(),
        '/destination-all': (context) => const DestinationAllList()
      },
    );
  }
}
