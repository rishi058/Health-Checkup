import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:health_checkups_app/color-palette/colors.dart';
import 'package:health_checkups_app/models/cart_model.dart';
import 'package:health_checkups_app/sizer/sizer.dart';
import 'package:health_checkups_app/ui_components/buttons/report_radio.dart';
import 'package:health_checkups_app/ui_components/cards/cart_card.dart';
import 'package:health_checkups_app/ui_components/cards/dateTime_card.dart';

import '../ui_components/cards/receipt_card.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  int total = 0, discount = 0, amountToPay = 0;

  void setBill(){
    total = 0; discount = 0; amountToPay = 0;
    for(int i=0; i<myCart.length; i++){
      total += myCart[i].maxPrice;
      amountToPay += myCart[i].minPrice;
    }
    discount = total - amountToPay;
  }

  void refresh(){
    setBill();
    setState(() {});
  }

  @override
  void initState() {
    refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: (){
            myDate = "";
            myTime = "";
            Navigator.of(context).popAndPushNamed('/home_screen');
          },
        ),
        title: const Text('My Cart'),
        actions: const [
          Icon(Icons.more_vert, color: skyBlue)
        ],
      ),
      body:
      myCart.isEmpty ?
      Center(
        child: Text('Your cart is empty.', style: TextStyle(color: primaryBlue, fontSize: 15.sp, fontWeight: FontWeight.w600),),
      ) :
      SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                width: double.infinity,
                child: Text('Order review', style: TextStyle(color: primaryBlue, fontSize: 15.sp, fontWeight: FontWeight.w600),),
            ),
            buildListView(myCart, refresh),
            dateTime(context),
            receipt(total, discount, amountToPay),
            reportRadio(refresh),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: GestureDetector(
          onTap: (){
            if(myDate.isNotEmpty && myTime.isNotEmpty){
              if(kDebugMode){
                print(myDate);
                print(myTime);
                print("isHardCopyIncluded : $isHardCopyIncluded");
                for(int i=0; i<myCart.length; i++){
                  print(myCart[i].testName);
                }
              }
              myCart.clear();
              myTime="";
              myDate="";
              Navigator.of(context).popAndPushNamed('/success_screen');
            }
          },
          child: Container(
            width: double.infinity,
            height: 50.h,
            decoration: BoxDecoration(
              color: myDate.isEmpty || myTime.isEmpty ?  grey : secondaryBlue,
              borderRadius: BorderRadius.circular(10.sp)
            ),
            child:Center(child: Text('Schedule', style: TextStyle(fontSize: 12.sp, color: Colors.white),)),
          ),
        ),
      )
    );
  }
}

Widget buildListView(List<CartItem> carts, Function update) {
  return ListView.builder(
    padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 2.h),
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: carts.length, // Change this to the number of cards you want to display
    itemBuilder: (BuildContext context, int index) {
      return cartCard(carts[index], update);
    },
  );
}
