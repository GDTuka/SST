import 'package:flutter/material.dart';
import 'package:one/pages/MainNav.dart';
import 'package:one/pages/profile.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(
    primaryColor: Colors.white
  ),
    initialRoute: '/',
    routes: {
    '/': (context) => MainNav(),
      '/Profile': (context) => Profile()
},
))

;