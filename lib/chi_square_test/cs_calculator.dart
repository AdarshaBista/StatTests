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
    double largestNumber = Utility.findLargest(numbers);
    double smallestNumber = Utility.findSmallest(numbers);

    _intervals = _createIntervals(
        smallestNumber, largestNumber, intervalWidth, divFactor);
  }

  List<StatInterval<double>> _createIntervals(
      double from, double to, double width, double divFactor) {
    List<StatInterval<double>> intervals = List<StatInterval<double>>();
    double offset = 1.0 / (divFactor * 10.0);

    // Add the first interval
    intervals.add(StatInterval<double>(
      start: Utility.setPrecisionTo2(from),
      end: Utility.setPrecisionTo2(from + width - offset),
    ));

    // Add the rest
    for (int i = 1; intervals[i - 1].end < to; ++i) {
      double prevIntervalEnd = intervals[i - 1].end;
      intervals.add(StatInterval<double>(
        start: Utility.setPrecisionTo2(prevIntervalEnd + offset),
        end: Utility.setPrecisionTo2(prevIntervalEnd + width),
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
