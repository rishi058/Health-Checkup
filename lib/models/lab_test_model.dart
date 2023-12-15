
class LabTest {
  String testName = "";
  int countOfTests = 0;
  int durationInHours = 0;
  int maxPrice = 0;
  int minPrice = 0;

  LabTest(this.testName, this.countOfTests, this.durationInHours, this.maxPrice,
      this.minPrice);
}

List<LabTest> listOfTests = [
  LabTest("Thyroid Profile", 3, 24, 1400, 1000),
  LabTest("Iron Study Test", 4, 24, 1000, 600),
  LabTest("Thyroid Profile2", 3, 24, 1400, 1000),
  LabTest("Iron Study Test2", 4, 24, 1000, 600),
];
