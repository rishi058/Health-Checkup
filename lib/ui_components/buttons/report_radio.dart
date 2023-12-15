import 'package:flutter/material.dart';
import 'package:health_checkups_app/sizer/sizer.dart';
import '../../color-palette/colors.dart';
import '../../models/cart_model.dart';

Widget reportRadio(Function update) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10.h),
    padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
    width: 335.w,
    height: 150.h,
    decoration: BoxDecoration(
        border: Border.all(width: 2, color: lightGrey),
        borderRadius: BorderRadius.circular(10.sp)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            isHardCopyIncluded = !isHardCopyIncluded;
            update();
          },
          child: Row(
            children: [
              radio(isHardCopyIncluded),
              const Text('Hard Copy of Report'),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 25.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Reports will be delivered within 3-4 working days. '
                'Hard copy charges are non-refundable once the reports '
                'have been dispatched.',
                style: TextStyle(color: Colors.black54, fontSize: 9.sp),
              ),
              SizedBox(height: 10.h),
              Text(
                '₹150 per person',
                style: TextStyle(color: Colors.black54, fontSize: 9.sp),
              ),
            ],
          ),
        )
      ],
    ),
  );
}

Widget radio(bool check) {
  return Container(
    margin: EdgeInsets.all(5.sp),
    padding: EdgeInsets.all(2.sp),
    width: 17.5.w,
    height: 17.5.h,
    decoration: BoxDecoration(
        border: Border.all(width: 2, color: primaryBlue),
        shape: BoxShape.circle),
    child: check
        ? Container(
            decoration:
                const BoxDecoration(color: primaryBlue, shape: BoxShape.circle),
          )
        : const SizedBox(width: 0),
  );
}
