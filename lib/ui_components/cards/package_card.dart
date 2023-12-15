import 'package:flutter/material.dart';
import 'package:health_checkups_app/color-palette/colors.dart';
import 'package:health_checkups_app/models/cart_model.dart';
import 'package:health_checkups_app/models/package_model.dart';
import 'package:health_checkups_app/sizer/sizer.dart';
import 'package:health_checkups_app/ui_components/buttons/add_to_cart2.dart';

Widget packageCard(Package currentPackage, Function update){
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
    padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
    height: 280.w,
    width: 200.w,
    decoration: BoxDecoration(
      border: Border.all(width: 2, color: lightGrey),
      borderRadius: BorderRadius.circular(8.sp)
    ),
    
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start ,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/plus_logo.png', scale: 0.75),
              SizedBox(
                width: 55.w,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.sp),
                    child: Image.asset('assets/badge2.png')),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 12.sp),
          child: Text(currentPackage.testName, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp),),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start ,
          children: [
            Text('Include ${currentPackage.countOfTests} Tests : ', style: const TextStyle(color: Colors.blueGrey),),
            Container(
              margin: EdgeInsets.only(left: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start ,
                children: [
                  Text('• ${currentPackage.includedTests[0]}',style: const TextStyle(color: Colors.blueGrey),),
                  Text('• ${currentPackage.includedTests[1]}',style: const TextStyle(color: Colors.blueGrey),),
                ],
              ),
            ),
            const Text('View more',style: TextStyle(color: Colors.blueGrey, decoration: TextDecoration.underline),),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('₹${currentPackage.price}/-', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: skyBlue)),
              InkWell(
                borderRadius: BorderRadius.circular(10.sp),
                  onTap: (){
                    if(myCart.any((item) => item.testName == currentPackage.testName)){return;}
                    myCart.add(CartItem(currentPackage.testName, currentPackage.price, currentPackage.price));
                      update();
                  },
                  child: addPackageButton(currentPackage)),
            ],
          ),
        ),
      ],
    ),
  );
}