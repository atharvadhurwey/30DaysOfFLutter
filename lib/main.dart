import 'package:flutter/material.dart';
import 'package:flutter_tutorial/pages/home_page.dart';
import 'package:flutter_tutorial/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      darkTheme: ThemeData(brightness: Brightness.dark),
      routes: {
        "/":(context) => HomePage(),
        "/login":(context) => LoginPage(),
      },
    );
  }
}
