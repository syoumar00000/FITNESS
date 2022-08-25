import 'package:flutter/material.dart';
import 'package:healthyapp/screens/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitness App',
      theme:
          ThemeData(appBarTheme: const AppBarTheme(color: Color(0xFF192A56))),
      home: const OnBoardingScreen(),
    );
  }
}
