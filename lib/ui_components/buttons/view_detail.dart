import 'package:flutter/material.dart';
import 'package:health_checkups_app/color-palette/colors.dart';
import 'package:health_checkups_app/sizer/sizer.dart';

Widget viewDetail(){
  return Container(
    margin: EdgeInsets.symmetric(vertical: 5.h),
    width: 125.w,
    height: 30.h,
    decoration: BoxDecoration(
        border: Border.all(width: 1, color: primaryBlue),
        borderRadius: BorderRadius.circular(5.sp),
    ),
    child: Center(
      child: Text('View details', style: TextStyle(fontSize: 8.sp, color: primaryBlue, fontWeight: FontWeight.w600),),
    ),
  );
}