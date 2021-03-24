import 'package:dwm14/screens/detail.dart';
import 'package:dwm14/screens/login.dart';
import 'package:dwm14/screens/register.dart';
import 'package:dwm14/screens/home.dart';
import 'package:dwm14/screens/profile.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  '/home': (context) => HomeScreen(),
  '/detail': (context) => DetailScreen(),
  '/profile': (context) => ProfileScreen(),
  '/register': (context) => RegisterScreen(),
  '/login': (context) => LoginScreen(),
};
