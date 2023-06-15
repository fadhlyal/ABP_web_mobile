import 'package:flutter/material.dart';

import '../screens/SplashScreen.dart';
import '../screens/BotNavBar.dart';
import '../screens/BotNavBarGuest.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "LaporAja",
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black)),
      home: NavBarGuest(),
    );
  }
}
