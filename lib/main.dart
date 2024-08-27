import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn/appPreferences/preferences.dart';
import 'package:vpn/screens/home_screen.dart';


late Size sizeScreen;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

 await AppPreferences.initHive();
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
      themeMode: AppPreferences.isModeDark ? ThemeMode.dark : ThemeMode.light,
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


extension AppTheme on ThemeData{
  Color get lightTextColor  => AppPreferences.isModeDark ? Colors.white70 : Colors.black54;
  Color get bottomNavigationColor  => AppPreferences.isModeDark ? Colors.white12 : Colors.redAccent;

}

