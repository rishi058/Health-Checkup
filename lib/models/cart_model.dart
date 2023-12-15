import 'package:health_checkups_app/models/package_model.dart';
import 'lab_test_model.dart';

class CartItem{
  String testName = "";
  int maxPrice = 0;
  int minPrice = 0;

  CartItem(this.testName, this.maxPrice, this.minPrice);
}

/// My Orders :-
DateTime currentDate = DateTime.now();
String myDate = "";
String myTime = "";
bool isHardCopyIncluded = false;
List<CartItem> myCart = [];