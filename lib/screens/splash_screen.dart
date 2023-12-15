import 'dart:async';
import 'package:flutter/material.dart';
import 'package:health_checkups_app/sizer/sizer.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void trigger(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Navigator.popAndPushNamed(context, '/home_screen');
    });
  }

  @override
  Widget build(BuildContext context) {
    trigger(context);
    return Scaffold(
      body: Center(
        child: Text('Logo', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp),),
      ),
    );
  }
}
