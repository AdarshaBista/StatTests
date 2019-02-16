import 'package:stat_tests/utils/utility.dart';

class CSCalculator {
  List<double> numbers;
  final double divFactor;
  final double intervalWidth;

  double smallestNumber;
  double largestNumber;
  double expected;
  List<Interval> observed = [];
  List<double> ithCalcValues = [];

  CSCalculator({this.numbers, this.divFactor, this.intervalWidth}) {
    largestNumber = Utility.findLargest(numbers);
    smallestNumber = Utility.findSmallest(numbers);
    
    observed = Utility.createIntervals(
        smallestNumber, largestNumber, intervalWidth, divFactor);
    _populateIntervals();
    
    int intervalNum = observed.length == 0 ? 1 : observed.length;
    expected = Utility.setPrecisionTo4(numbers.length / intervalNum);
  }

  void _populateIntervals() {
    observed.forEach((interval) {
      interval.count = _getCount(interval);
    });
  }

  int _getCount(Interval interval) {
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
}
