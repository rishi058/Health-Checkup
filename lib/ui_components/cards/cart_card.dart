import 'package:flutter/material.dart';
import 'package:health_checkups_app/color-palette/colors.dart';
import 'package:health_checkups_app/sizer/sizer.dart';
import 'package:health_checkups_app/ui_components/buttons/upload_doc.dart';
import '../../models/cart_model.dart';
import '../buttons/remove_button.dart';

Widget cartCard(CartItem cart, Function update){
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10.h),
    width: 335.w,
    height: 180.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.w),
      border: Border.all(width: 2, color: lightGrey),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title(),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          height: 135.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titlePrice(cart.testName, cart.maxPrice, cart.minPrice),
              InkWell(
                  onTap: (){
                    myCart.remove(cart);
                    update();
                  },
                  child: remove()),
              uploadDoc()
            ],
          ),
        )

      ],
    ),
  );
}

Widget title(){
  return  Container(
    width: 342.w,
    height: 40.h,
    decoration: BoxDecoration(
        color: secondaryBlue,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(7.sp), topRight: Radius.circular(7.sp))
    ),
    child: Center(child: Text('Pathology Test', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 10.sp),)),
  );
}

Widget titlePrice(String testName, int maxPrice, int minPrice){
  return Container(
    margin: EdgeInsets.symmetric(vertical: 5.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(testName, style: TextStyle(fontWeight: FontWeight.w600, color: primaryBlue, fontSize: 12.sp),),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('₹$minPrice/-', style: TextStyle(fontSize: 12.5.sp, fontWeight: FontWeight.w600, color: skyBlue)),
            maxPrice==minPrice ? const SizedBox(height:0 ) : Text('₹$maxPrice', style: TextStyle(fontSize: 8.5.sp, color: Colors.blueGrey, decoration: TextDecoration.lineThrough)),
          ],
        ),
      ],
    ),
  );
}