import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn/screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Free VPN',
      theme: ThemeData(
     appBarTheme: AppBarTheme(
       centerTitle: true,
       elevation: 3,
     ),

      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: 3,

        )
      ),

      home: HomeScreen(),
    );
  }
}

