import 'package:flutter/material.dart';
import 'package:health_checkups_app/color-palette/colors.dart';
import 'package:health_checkups_app/models/cart_model.dart';
import 'package:health_checkups_app/sizer/sizer.dart';
import '../../models/package_model.dart';

Widget addPackageButton(Package currentPackage) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 5.h),
    width: 110.w,
    height: 35.h,
    decoration: BoxDecoration(
      border: Border.all(width: 1, color: primaryBlue),
      color: myCart.any((item) => item.testName == currentPackage.testName) ? primaryBlue : white,
      borderRadius: BorderRadius.circular(5.sp),
    ),
    child: Center(
      child: myCart.any((item) => item.testName == currentPackage.testName)
          ? Text('Added To Cart',
              style: TextStyle(
                  fontSize: 8.sp,
                  color: white,
                  fontWeight: FontWeight.w600))
          : Text('Add To Cart',
              style: TextStyle(
                  fontSize: 8.sp,
                  color: primaryBlue,
                  fontWeight: FontWeight.w600)),
    ),
  );
}
