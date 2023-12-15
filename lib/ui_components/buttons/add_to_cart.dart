import 'package:flutter/material.dart';
import 'package:health_checkups_app/color-palette/colors.dart';
import 'package:health_checkups_app/models/cart_model.dart';
import 'package:health_checkups_app/sizer/sizer.dart';

import '../../models/lab_test_model.dart';

Widget addToCart(LabTest currentTest){
  return Container(
    width: 125.w,
    height: 30.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5.sp),
      color: myCart.any((item) => item.testName == currentTest.testName) ? skyBlue : primaryBlue,
    ),
    child: Center(
      child: myCart.any((item) => item.testName == currentTest.testName) ?
                Text('Added to cart', style: TextStyle(fontSize: 8.sp, color: Colors.white)) :
                Text('Add to cart', style: TextStyle(fontSize: 8.sp, color: Colors.white)),
    ),
  );
}