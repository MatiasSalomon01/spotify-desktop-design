import 'package:flutter/material.dart';
import 'package:spotify_desktop/constants/colors.dart';
import 'package:spotify_desktop/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:spotify_desktop/services/general_service.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GeneralService(),
        )
      ],
      child: const MyApp(),
    );
  }
}

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
        // sliderTheme: SliderThemeData(
        //   // trackHeight: 4,
        //   // thumbColor: white,
        //   // trackShape: RectangularSliderTrackShape(),
        //   // // activeTrackColor: white,
        //   // inactiveTrackColor: const Color(0xff4d4d4d),
        //   // overlayShape: RoundSliderOverlayShape(overlayRadius: 0),
        //   overlayShape: SliderComponentShape.noOverlay,
        //   // thumbShape: const RoundSliderThumbShape(
        //   //   enabledThumbRadius: 5,
        //   //   disabledThumbRadius: 0,
        //   //   pressedElevation: 0,
        //   // ),
        // ),
      ),
    );
  }
}
