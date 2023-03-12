import 'package:flutter/material.dart';
import 'package:travel_app/apis/auth.api.dart';
import 'package:travel_app/screens/booking_room/booking_room.dart';
import 'package:travel_app/screens/destination_all_list/destination_all_list.dart';
import 'package:travel_app/screens/home/home.screen.dart';

import 'package:travel_app/screens/authentication/sign_in.screen.dart';
import 'package:travel_app/screens/authentication/sign_up.screen.dart';
import 'package:travel_app/utils/storage.service.dart';

import 'models/user.model.dart';

void main() {
  runApp(const TravelApp());
}

class TravelApp extends StatefulWidget {
  const TravelApp({Key? key}) : super(key: key);

  @override
  TravelAppState createState() => TravelAppState();
}

class TravelAppState extends State<TravelApp> {
  final _storageService = StorageService();
  bool isAuthenticated = false;
  User? user;

  Future<void> preProcess() async {
    // no exist token
    final isTokenExisted = await _storageService.hasKey('access_token');
    if (isTokenExisted == false) {
      setState(() {
        isAuthenticated = false;
      });
    } else {
      final token = await _storageService.getValueByKey('access_token');
      final user = await AuthApi.getProfile(token!);
      if (user == null) {
        setState(() {
          isAuthenticated = false;
        });
      } else {
        setState(() {
          isAuthenticated = true;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    preProcess();
  }

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
      home: isAuthenticated ? const HomeScreen() : const SignInScreen(),

      routes: {
        '/sign-in': (context) => const SignInScreen(),
        '/sign-up': (context) => const SignUpScreen(),
        '/home': (context) => const HomeScreen(),
        '/destination-all': (context) => const DestinationAllList()
      },
    );
  }
}
