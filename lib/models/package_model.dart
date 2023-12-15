class Package{
  String testName = "";
  int countOfTests = 0;
  int durationInHours = 0;
  int price = 0;
  List<String> includedTests = [];

  Package(this.testName, this.countOfTests, this.durationInHours, this.price, this.includedTests);
}

List<Package> popularPackages = [
  Package("Full Body Checkup", 92, 48, 2000, ["Blood Glucose Fasting", "Liver Function Test"]),
  Package("Full Body Checkup2", 92, 48, 2000, ["Blood Glucose Fasting", "Liver Function Test"]),
];