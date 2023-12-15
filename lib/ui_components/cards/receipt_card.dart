import 'package:flutter/material.dart';
import 'package:health_checkups_app/sizer/sizer.dart';

import '../../color-palette/colors.dart';

Widget receipt(int total, int discount, int amountToPay){
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10.h),
    padding: EdgeInsets.all(10.sp),
    width: 335.w,
    height: 165.h,
    decoration: BoxDecoration(
        border: Border.all(width: 2, color: lightGrey),
        borderRadius: BorderRadius.circular(10.sp)
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('M.R.P Total', style: TextStyle(color: Colors.black54, fontSize: 10.sp),),
            Text('₹$total', style: TextStyle(color: Colors.black54, fontSize: 10.sp),),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Discount', style: TextStyle(color: Colors.black54, fontSize: 10.sp),),
            Text('₹$discount', style: TextStyle(color: Colors.black54, fontSize: 10.sp),),
          ],
        ),
        SizedBox(height: 22.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Amount to be paid', style: TextStyle(fontSize: 12.sp, color: primaryBlue, fontWeight: FontWeight.w600,)),
            Text('₹$amountToPay/-', style: TextStyle(fontSize: 12.sp, color: primaryBlue, fontWeight: FontWeight.w600,)),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total Savings',  style: TextStyle(color: Colors.black54, fontSize: 12.sp),),
            Text('₹$discount/-', style: TextStyle(fontSize: 12.sp, color: primaryBlue, fontWeight: FontWeight.w600,)),
          ],
        )
      ],
    ),
  );
}