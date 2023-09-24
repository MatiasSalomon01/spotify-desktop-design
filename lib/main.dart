import 'package:flutter/material.dart';
import 'package:spotify_desktop/constants/colors.dart';
import 'package:spotify_desktop/pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
        scrollbarTheme: ScrollbarThemeData(
          trackVisibility: MaterialStateProperty.all(true),
          thickness: MaterialStateProperty.all(12),
          thumbColor: MaterialStateProperty.all(lightGrey.withOpacity(.4)),
          trackBorderColor: MaterialStateProperty.all(green),
          radius: const Radius.circular(0),
          minThumbLength: 35,
        ),
      ),
    );
  }
}
