import 'package:stat_tests/utils/utility.dart';
import 'package:stat_tests/utils/stat_interval.dart';

class CSCalculator {
  final List<double> numbers;
  final double divFactor;
  final double intervalWidth;

  double _expected;
  List<StatInterval> _intervals = [];
  List<int> _observed = [];
  List<double> _ithCalcValues = [];
  double _chiSquareCalc;

  double get expected => _expected;
  List<int> get observed => _observed;
  List<double> get ithCalcValues => _ithCalcValues;
  double get chiSquareCalc => _chiSquareCalc;

  // Return string representation of interval
  List<String> get intervals {
    List<String> intervalsStr = List.generate(
        _intervals.length, (int index) => _intervals[index].toString());
    return intervalsStr;
  }

  CSCalculator({this.numbers, this.divFactor, this.intervalWidth}) {
    double largestNumber = Utility.findLargest(numbers);
    double smallestNumber = Utility.findSmallest(numbers);

    _intervals = Utility.createIntervals(
        smallestNumber, largestNumber, intervalWidth, divFactor);
    
    _calculateObserved();
    _expected = Utility.setPrecisionTo4(numbers.length / _intervals.length);
    _calculateChiSquare();
  }

  void _calculateObserved() {
    _observed = List.generate(
        _intervals.length, (int index) => _getObservedCount(_intervals[index]));
  }

  int _getObservedCount(StatInterval interval) {
    int count = 0;
    numbers.forEach((number) {
      if (interval.start <= number && interval.end >= number) count++;
    });
    return count;
  }

  void _calculateChiSquare() {
    _chiSquareCalc = 0.0;
    for (int i = 0; i < _intervals.length; ++i) {
      double diff = _observed[i] - _expected;
      double diffSquared = diff * diff;
      double ithCalcValue = Utility.setPrecisionTo4(diffSquared / _expected);
      _ithCalcValues.add(ithCalcValue);
      _chiSquareCalc += ithCalcValue;
    }
  }
}
