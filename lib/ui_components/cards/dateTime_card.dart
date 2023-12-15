import 'package:flutter/material.dart';
import 'package:health_checkups_app/models/cart_model.dart';
import 'package:health_checkups_app/sizer/sizer.dart';

import '../../color-palette/colors.dart';

Widget dateTime(BuildContext context){
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10.h),
    width: 335.w,
    height: 90.h,
    decoration: BoxDecoration(
      border: Border.all(width: 2, color: lightGrey),
      borderRadius: BorderRadius.circular(7.sp)
    ),
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      child: Row(
        children: [
          const Icon(Icons.calendar_today_sharp),
          SizedBox(width: 10.w),
          InkWell(
            onTap: (){
              Navigator.of(context).pushNamed('/date_time_screen');
            },
            child: Container(
              width: 270.w,
              height: 40.h,
              padding: EdgeInsets.only(left: 5.w),
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: lightGrey),
                  borderRadius: BorderRadius.circular(3.sp)
              ),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child:
                  myDate.isNotEmpty && myTime.isNotEmpty ? Text("$myDate $myTime", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 10.sp))
                  : Text('Select date', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 10.sp))),
            ),
          ),
        ],
      ),
    ),
  );
}