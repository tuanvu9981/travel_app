import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:travel_app/screens/authentication/sign_in.screen.dart';
import 'package:travel_app/screens/home/home.screen.dart';

final loggedOutRoute = RouteMap(routes: {
  '/': ((route) => const MaterialPage(child: SignInScreen())),
});

final loggedInRoute = RouteMap(routes: {
  '/': (((route) => const MaterialPage(child: HomeScreen()))),
});
