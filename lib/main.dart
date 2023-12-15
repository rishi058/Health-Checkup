import 'package:flutter/material.dart';
import 'package:health_checkups_app/screens/cart_screen.dart';
import 'package:health_checkups_app/screens/date_time_screen.dart';
import 'package:health_checkups_app/screens/home_screen.dart';
import 'package:health_checkups_app/screens/splash_screen.dart';
import 'package:health_checkups_app/screens/success_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, child!),
          maxWidth: 700,
          defaultScale: true,
          background: Container(color: const Color(0xFFF5F5F5))),
      home: const Start(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
        context: context,
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: GoogleFonts.inter().fontFamily,
              primarySwatch: Colors.indigo,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
              useMaterial3: true,
            ),
            home: const SplashScreen(),
            routes: {
              '/home_screen': (context) => const HomeScreen(),
              '/cart_screen': (context) => const CartScreen(),
              '/date_time_screen': (context) => const DateTimeScreen(),
              '/success_screen': (context) => const SuccessScreen(),
            },
          );
        }
    );
  }
}