import 'dart:math';
import 'package:stat_tests/utils/utility.dart';
import 'package:stat_tests/utils/stat_interval.dart';

class GapCalculator {
  final double divFactor;
  final List<double> numbers;
  final double gapLength;

  List<double> _symbols;
  Map<double, List<int>> _gapMap = {};
  List<StatInterval> _intervals = [];
  List<int> _frequencies = [];
  List<double> _relativeFreqs = [];
  List<double> _cumulativeFreqs = [];
  List<double> _fOfX = [];
  List<double> _fOfxMinusSOfX = [];
  double _dCalc;
  int _total;

  Map<double, List<int>> get gapMap => _gapMap;
  List<int> get frequencies => _frequencies;
  List<double> get relativeFreqs => _relativeFreqs;
  List<double> get cumulativeFreqs => _cumulativeFreqs;
  List<double> get fOfX => _fOfX;
  List<double> get fOfxMinusSOfX => _fOfxMinusSOfX;
  double get dCalc => _dCalc;

  // Return string representation of interval
  List<String> get intervals {
    List<String> intervalsStr = List.generate(
        _intervals.length, (int index) => _intervals[index].toString());
    return intervalsStr;
  }

  GapCalculator({this.numbers, this.divFactor, this.gapLength}) {
    _symbols = numbers.toSet().toList();
    _symbols.sort();
    _total = numbers.length - _symbols.length;

    _populateGapMap();
    _populateIntervals();
    _calculateFreqs();
    _calculateRelativeFreqs();
    _calculateCumulativeFreqs();
    _calculateFOfX();
    _calculateFOfxMinusSOfx();
    _claculateDCalc();
  }

  void _populateGapMap() {
    _symbols.forEach((symbol) {
      List<int> ithGapsList = [];

      // Calculate gaps between numbers
      _calculateGaps(symbol, ithGapsList);

      // Remove the initial gap
      if (ithGapsList.isNotEmpty) ithGapsList.removeAt(0);

      // Add list to map
      _gapMap[symbol] = List.from(ithGapsList);
    });
  }

  void _calculateGaps(double symbol, List<int> ithGapsList) {
    int prevIndex = 0;
    for (int i = 0; i < numbers.length; ++i) {
      if (symbol == numbers[i]) {
        ithGapsList.add(i - prevIndex - 1);
        prevIndex = i;
      }
    }
  }

  void _populateIntervals() {
    List<int> flattenedMapValues = _gapMap.values.expand((i) => i).toList();
    double largestNumber = Utility.findLargest(flattenedMapValues);
    double smallestNumber = Utility.findSmallest(flattenedMapValues);

    _intervals = Utility.createIntervals(
        smallestNumber, largestNumber, gapLength, divFactor);
  }

  void _calculateFreqs() {
    _frequencies = List.generate(_intervals.length,
        (int index) => _getFrequencyCount(_intervals[index]));
  }

  int _getFrequencyCount(StatInterval interval) {
    int count = 0;
    List<int> flattenedMapValues = _gapMap.values.expand((i) => i).toList();

    flattenedMapValues.forEach((number) {
      if (interval.start <= number && interval.end >= number) count++;
    });

    return count;
  }

  void _calculateRelativeFreqs() {
    _relativeFreqs = List.generate(_intervals.length,
        (int index) => Utility.setPrecisionTo4(_frequencies[index] / _total));
  }

  void _calculateCumulativeFreqs() {
    _cumulativeFreqs.add(_relativeFreqs[0]);
    for (int i = 1; i < _intervals.length; ++i) {
      double value = _cumulativeFreqs[i - 1] + _relativeFreqs[i];
      _cumulativeFreqs.add(Utility.setPrecisionTo4(value));
    }
  }

  void _calculateFOfX() {
    _fOfX = List.generate(_intervals.length, (int index) {
      int x = _intervals[index].end.toInt();
      double value = 1 - pow(0.9, x + 1);
      return Utility.setPrecisionTo4(value);
    });
  }

  void _calculateFOfxMinusSOfx() {
    _fOfxMinusSOfX = List.generate(
        _intervals.length,
        (int index) => Utility.setPrecisionTo4(
            (_fOfX[index] - _cumulativeFreqs[index]).abs()));
  }

  void _claculateDCalc() {
    _dCalc = Utility.findLargest(_fOfxMinusSOfX);
  }
}
