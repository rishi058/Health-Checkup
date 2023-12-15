import 'package:flutter/material.dart';
import 'package:health_checkups_app/color-palette/colors.dart';
import 'package:health_checkups_app/sizer/sizer.dart';

Widget uploadDoc(){
  return Container(
    width: 260.w,
    height: 35.h,
    margin: EdgeInsets.all(2.sp),
    decoration: BoxDecoration(
      border: Border.all(width: 2, color: primaryBlue),
      borderRadius: BorderRadius.circular(15.sp),
    ),
    child: Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.upload_outlined, color: primaryBlue, size: 16.sp),
          SizedBox(width: 10.w),
          Text('Upload Prescription (optional)', style: TextStyle(fontSize: 10.sp, color: primaryBlue, fontWeight: FontWeight.w600,), ),
        ],
      ),
    ),
  );
}