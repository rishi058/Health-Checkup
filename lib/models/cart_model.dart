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