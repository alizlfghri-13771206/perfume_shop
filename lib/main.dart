import 'package:flutter/material.dart';
// import 'package:parfumo_ui/root.dart';
import 'package:atramin/theme/app_theme.dart';
import "package:atramin/screens/splash_screen.dart";

void main() {

  runApp(const ParfumoApp());
}

class ParfumoApp extends StatelessWidget {
  const ParfumoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parfumo',
      theme: AppTheme.light,
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
    );
  }
}
