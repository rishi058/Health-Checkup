import 'package:flutter/material.dart';
import 'package:health_checkups_app/sizer/sizer.dart';

import '../color-palette/colors.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.of(context).popAndPushNamed('/home_screen');
          },
        ),
        title: const Text('Success'),
        actions: const [
          Icon(Icons.more_vert, color: skyBlue)
        ],
      ),
        body: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 60.h),
            width: 330.w,
            height: 420.h,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: lightGrey),
              borderRadius: BorderRadius.circular(10.sp)
            ),
            child: Center(
              child: Column(
                children: [
                  Image.asset('assets/success_logo.png'),
                  SizedBox(height: 15.h),
                  Text('Lab tests have been scheduled successfully, '
                      'You will receive a mail of the same.',
                  style: TextStyle(fontSize: 15.sp), textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 15.h),
                  Text('11 Oct 2023  |  9 AM', style:TextStyle(fontSize: 13.sp, color: Colors.black54))
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: GestureDetector(
            onTap: (){
              Navigator.of(context).popAndPushNamed('/home_screen');
            },
            child: Container(
              width: double.infinity,
              height: 50.h,
              decoration: BoxDecoration(
                  color: secondaryBlue,
                  borderRadius: BorderRadius.circular(10.sp)
              ),
              child:Center(child: Text('Back to home', style: TextStyle(fontSize: 12.sp, color: Colors.white),)),
            ),
          ),
        )
    );
  }
}
