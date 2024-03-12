import 'package:cooking_recipe_app/constants/constant.dart';
import 'package:cooking_recipe_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent, // status bar color
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Cooking Recipe App',
      theme: ThemeData(
        textTheme: GoogleFonts.ralewayTextTheme(
        Theme.of(context).textTheme,


      )),
      home: const HomeScreen(),
    );
  }
}


