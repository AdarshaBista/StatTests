import 'package:stat_tests/utils/utility.dart';

class CSCalculator {
  List<double> numbers;
  final double divFactor;
  final double intervalWidth;

  double smallestNumber;
  double largestNumber;
  double expected;
  List<StatInterval> intervals = [];
  List<int> observed = [];
  List<double> ithCalcValues = [];

  CSCalculator({this.numbers, this.divFactor, this.intervalWidth}) {
    largestNumber = Utility.findLargest(numbers);
    smallestNumber = Utility.findSmallest(numbers);

    intervals = Utility.createIntervals(
        smallestNumber, largestNumber, intervalWidth, divFactor);
    _populateIntervals();

    int intervalNum = intervals.length == 0 ? 1 : intervals.length;
    expected = Utility.setPrecisionTo4(numbers.length / intervalNum);
  }

  void _populateIntervals() {
    observed = List.generate(
        intervals.length, (int index) => _getObservedCount(intervals[index]));
  }

  int _getObservedCount(StatInterval interval) {
    int count = 0;
    numbers.forEach((number) {
      if (interval.start <= number && interval.end >= number) count++;
    });
    return count;
  }

  double calculateChiSquare() {
    double chiSquareCalc = 0.0;
    for(int i = 0; i < intervals.length; ++i){
      double diff = observed[i] - expected;
      double diffSquared = diff * diff;
      double ithCalcValue = Utility.setPrecisionTo4(diffSquared / expected);
      ithCalcValues.add(ithCalcValue);
      chiSquareCalc += ithCalcValue;
    }

    return chiSquareCalc;
  }
}
