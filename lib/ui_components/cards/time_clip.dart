import 'package:flutter/material.dart';
import 'package:health_checkups_app/models/cart_model.dart';
import 'package:health_checkups_app/sizer/sizer.dart';
import '../../color-palette/colors.dart';


Widget timeClip(String time){
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.w),
    width: 90.w,
    height: 35.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5.sp),
      border: Border.all(width: 2, color: primaryBlue),
      color: myTime == time ? primaryBlue : white
    ),
    child: Center(
      child: Text(time, style: TextStyle(
        color: myTime==time ? white : Colors.black54,
      ),),
    ),
  );
}