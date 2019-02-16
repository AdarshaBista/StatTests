import 'package:stat_tests/utils/utility.dart';

class CSCalculator {
  final double divFactor;
  List<double> numbers;
  final double intervalWidth;

  double smallestNumber;
  double largestNumber;
  double expected;
  List<Interval> observed = [];
  List<double> ithCalcValues = [];

  CSCalculator({this.numbers, this.divFactor, this.intervalWidth}) {
    // TO BE REMOVED
    numbers = Utility.converStrToList(Utility.n, divFactor);

    largestNumber = Utility.findLargest(numbers);
    smallestNumber = Utility.findSmallest(numbers);
    observed = Utility.createIntervals(
        smallestNumber, largestNumber, intervalWidth, divFactor);
    observed.forEach((interval) {
      interval.count = populateInterval(interval);
    });
    int intervalNum = observed.length == 0 ? 1 : observed.length;
    expected = Utility.setPrecisionTo4(numbers.length / intervalNum);
  }

  int populateInterval(Interval interval) {
    int count = 0;
    numbers.forEach((number) {
      if (interval.start <= number && interval.end >= number) count++;
    });
    return count;
  }

  double calculateChiSquare() {
    double chiSquareCalc = 0.0;
    observed.forEach((obsValue) {
      double diff = obsValue.count - expected;
      double diffSquared = diff * diff;
      double ithCalcValue = Utility.setPrecisionTo4(diffSquared / expected);
      ithCalcValues.add(ithCalcValue);
      chiSquareCalc += ithCalcValue;
    });

    return chiSquareCalc;
  }

  List<Interval> getIntervals() => observed;
  List<double> getIthCalcValues() => ithCalcValues;
  double getExpected() => expected;
}
