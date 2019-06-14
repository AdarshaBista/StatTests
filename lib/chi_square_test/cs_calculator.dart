import 'dart:math';
import 'package:stat_tests/utils/utility.dart';
import 'package:stat_tests/utils/stat_interval.dart';

class CSCalculator {
  final List<double> numbers;
  final double divFactor;
  final double intervalWidth;

  double _expected;
  List<StatInterval<double>> _intervals = [];
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
    _populateIntervals();
    _calculateObserved();
    _expected = Utility.setPrecisionTo4(numbers.length / _intervals.length);
    _calculateChiSquare();
  }

  void _populateIntervals() {
    double largestNumber = numbers.reduce(max);
    double smallestNumber = numbers.reduce(min);

    _intervals = _createIntervals(smallestNumber, largestNumber, intervalWidth);
  }

  List<StatInterval<double>> _createIntervals(
      double from, double to, double width) {
    List<StatInterval<double>> intervals = List<StatInterval<double>>();
    int numOfDigits = width.toString().length - (width >= 1 ? 2 : 1);
    double offset = 1 / pow(10, numOfDigits);
    int precision = numOfDigits > 4 ? numOfDigits : 4;

    // Add the first interval
    intervals.add(StatInterval<double>(
      start: Utility.setPrecision(from, precision),
      end: Utility.setPrecision(from + width - offset, precision),
    ));

    // Add the rest
    for (int i = 1; intervals[i - 1].end < to; ++i) {
      double prevIntervalEnd = intervals[i - 1].end;
      intervals.add(StatInterval<double>(
        start: Utility.setPrecision(prevIntervalEnd + offset, precision),
        end: Utility.setPrecision(prevIntervalEnd + width, precision),
      ));
    }

    return intervals;
  }

  void _calculateObserved() {
    _observed = List.generate(
        _intervals.length, (int index) => _getObservedCount(_intervals[index]));
  }

  int _getObservedCount(StatInterval<double> interval) {
    int count = 0;
    numbers.forEach((number) {
      if (interval.start <= number && interval.end >= number) count++;
    });
    return count;
  }

  void _calculateChiSquare() {
    double sum = 0.0;
    for (int i = 0; i < _intervals.length; ++i) {
      double diff = _observed[i] - _expected;
      double diffSquared = diff * diff;
      double ithCalcValue = Utility.setPrecisionTo4(diffSquared / _expected);
      _ithCalcValues.add(ithCalcValue);
      sum += ithCalcValue;
    }
    _chiSquareCalc = Utility.setPrecisionTo4(sum);
  }
}
