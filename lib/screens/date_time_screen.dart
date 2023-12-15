import 'package:flutter/material.dart';
import 'package:health_checkups_app/models/cart_model.dart';
import 'package:health_checkups_app/sizer/sizer.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';
import '../color-palette/colors.dart';
import '../models/time.dart';
import '../ui_components/cards/time_clip.dart';


class DateTimeScreen extends StatefulWidget {
  const DateTimeScreen({super.key});

  @override
  State<DateTimeScreen> createState() => _DateTimeScreenState();
}

class _DateTimeScreenState extends State<DateTimeScreen> {

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
      DateTime inputDate = DateTime.parse(args.value.toString());
      currentDate = inputDate;
      final DateFormat formatter = DateFormat('dd/MM/yyyy');
      myDate = formatter.format(inputDate);
      refresh();
  }

  void refresh(){
    setState(() {});
  }

  @override
  void initState() {
    if(myDate.isEmpty){
      final DateFormat formatter = DateFormat('dd/MM/yyyy');
      myDate = formatter.format(DateTime.now());
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(myDate);
    print(myTime);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: (){
            myDate = "";
            myTime = "";
            Navigator.of(context).popAndPushNamed('/cart_screen');
          },
        ),
        title: const Text('Book Appointment'),
        actions: const [
          Icon(Icons.more_vert, color: skyBlue)
        ],
      ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                  width: double.infinity,
                  child:
                  Text('Select Date', style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600),),
              ),
              SizedBox(height: 20.h),
              Card(
                surfaceTintColor: white,
                color: white,
                elevation: 2,
                margin: EdgeInsets.symmetric(horizontal: 30.w),
                child: SfDateRangePicker(
                  initialSelectedDate: currentDate,
                  onSelectionChanged: _onSelectionChanged,
                  selectionMode: DateRangePickerSelectionMode.single,
                  enablePastDates: false,
                  showNavigationArrow: true,
                ),
              ),
              SizedBox(height: 15.h),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                width: double.infinity,
                child:
                Text('Select Time', style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600),),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding:EdgeInsets.symmetric(horizontal: 15.w),
                child: buildTimeButton(refresh),
              )
            ],
          ),
        ),

        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: GestureDetector(
            onTap: (){
              if(myDate.isNotEmpty && myTime.isNotEmpty){
                Navigator.of(context).popAndPushNamed('/cart_screen');
              }
            },
            child: Container(
              width: double.infinity,
              height: 50.h,
              decoration: BoxDecoration(
                  color: myDate.isNotEmpty && myTime.isNotEmpty ? secondaryBlue : grey,
                  borderRadius: BorderRadius.circular(10.sp)
              ),
              child:Center(child: Text('Confirm', style: TextStyle(fontSize: 12.sp, color: Colors.white),)),
            ),
          ),
        ),

    );
  }
}


Widget buildTimeButton(Function update) {
  return GridView.count(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    crossAxisCount: 3,
    mainAxisSpacing: 10.h,
    childAspectRatio: 90/35,
    children: List.generate(times.length, (i) {
      return GestureDetector(
          onTap: (){
            myTime = times[i];
            update();
          },
          child: timeClip(times[i]));
    }),
  );
}
