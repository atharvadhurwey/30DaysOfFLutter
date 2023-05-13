import 'package:flutter/material.dart';
import 'package:flutter_tutorial/pages/home_page.dart';
import 'package:flutter_tutorial/pages/login_page.dart';
import 'package:flutter_tutorial/utils/route.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          fontFamily: GoogleFonts.lato().fontFamily,
          ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      initialRoute: "/login",
      routes: {
        "/": (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
      },
    );
  }
}
