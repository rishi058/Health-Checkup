import 'package:flutter/material.dart';
import 'package:health_checkups_app/color-palette/colors.dart';
import 'package:health_checkups_app/models/cart_model.dart';
import 'package:health_checkups_app/models/package_model.dart';
import 'package:health_checkups_app/sizer/sizer.dart';
import 'package:health_checkups_app/ui_components/cards/lab_test_card.dart';
import 'package:health_checkups_app/ui_components/cards/package_card.dart';
import '../models/lab_test_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Logo',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp),
        ),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 5.w),
            child: InkWell(
              borderRadius: BorderRadius.circular(5.sp),
              onTap: () {
                Navigator.of(context).popAndPushNamed('/cart_screen');
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  myCart.isEmpty
                      ? const SizedBox(width: 0)
                      : Container(
                          padding: EdgeInsets.all(3.sp),
                          decoration: const BoxDecoration(
                            color: skyBlue,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            myCart.length.toString(),
                            style: TextStyle(fontSize: 8.sp),
                          ),
                        ),
                  const Icon(
                    Icons.shopping_cart,
                    color: primaryBlue,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                width: double.infinity,
                height: 40.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Popular Lab Tests',
                      style: TextStyle(
                          color: primaryBlue,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'View more →',
                      style: TextStyle(
                          color: primaryBlue,
                          fontSize: 10.sp,
                          decoration: TextDecoration.underline),
                    )
                  ],
                )),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                width: double.infinity,
                height: 470.h,
                child: buildLabTests(listOfTests, refresh)),
            Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                child: Text(
                  'Popular Packages',
                  style: TextStyle(
                      color: primaryBlue,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600),
                )),
            buildListView(popularPackages, refresh)
          ],
        ),
      ),
    );
  }
}

Widget buildListView(List<Package> packages, Function update) {
  return ListView.builder(
    padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 2.h),
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: packages
        .length, // Change this to the number of cards you want to display
    itemBuilder: (BuildContext context, int index) {
      return packageCard(packages[index], update);
    },
  );
}

Widget buildLabTests(List<LabTest> tests, Function update) {
  return GridView.count(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    crossAxisCount: 2,
    childAspectRatio: 140 / 175,
    children: List.generate(tests.length, (index) {
      return labTestCard(tests[index], update);
    }),
  );
}
