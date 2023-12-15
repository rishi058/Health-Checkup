import 'package:flutter/material.dart';
import 'package:health_checkups_app/color-palette/colors.dart';
import 'package:health_checkups_app/models/cart_model.dart';
import 'package:health_checkups_app/sizer/sizer.dart';
import 'package:health_checkups_app/ui_components/buttons/add_to_cart.dart';
import 'package:health_checkups_app/ui_components/buttons/view_detail.dart';
import '../../models/lab_test_model.dart';

Widget labTestCard(LabTest currentTest, Function update){
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
    decoration: BoxDecoration(
      border: Border.all(width: 1.sp, color: lightGrey),
      borderRadius: BorderRadius.circular(8.sp)
    ),
    child: Column(
      children: [
        title(currentTest.testName),
        SizedBox(
          height: 180.h,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             testCount(currentTest.countOfTests),
             duration(currentTest.durationInHours),
             prices(currentTest.minPrice, currentTest.maxPrice),
             InkWell(
                 onTap: (){
                      if(myCart.any((item) => item.testName == currentTest.testName)){return;}
                      myCart.add(CartItem(currentTest.testName, currentTest.maxPrice, currentTest.minPrice));
                      update();
                 },
                 child: addToCart(currentTest)),
             viewDetail()
           ],
          ),
        )
      ],
    ),
  );
}

Widget title(String testName){
  return Container(
    width: double.infinity,
    height: 35.h,
    decoration: BoxDecoration(
        color: secondaryBlue,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(7.sp), topRight: Radius.circular(7.sp))
    ),
    child: Center(child: Text(testName, style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 8.sp),)),
  );
}

Widget testCount(int testCounts){
  return  Container(
    width: double.infinity,
    margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
    height: 35.h,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Include $testCounts tests', style: TextStyle(fontSize: 10.sp, color: midBlack),),
        ClipRRect(
            borderRadius: BorderRadius.circular(5.sp),
            child: Image.asset('assets/badge.png'))
      ],
    ),
  );
}

Widget duration(int duration){
  return  Container(
    width: double.infinity,
    margin: EdgeInsets.only(left: 8.w),
    child: Text('Get report in $duration hours', style: TextStyle(fontSize: 8.sp), textAlign: TextAlign.left,),
  );
}

Widget prices(int minPrice, int maxPrice){
  return Container(
    margin: EdgeInsets.only(left: 8.w),
    child: Row(
      children: [
        Text('₹$minPrice', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600, color: primaryBlue)),
        SizedBox(width: 5.w),
        Text('₹$maxPrice', style: TextStyle(fontSize: 8.sp, decoration: TextDecoration.lineThrough), )
      ],
    ),
  );
}