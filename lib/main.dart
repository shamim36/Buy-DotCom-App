import 'package:buy_dotcom_app/utils/theme.dart';
import 'package:buy_dotcom_app/view/auth_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Amazon());
}

class Amazon extends StatelessWidget {
  const Amazon({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: AuthScreen(),
    );
  }
}
