import 'package:stat_tests/utils/stat_interval.dart';
import 'package:stat_tests/utils/utility.dart';
import 'dart:math';

class GapCalculator {
  final double divFactor;
  final List<double> numbers;
  final double gapLength;
  List<double> symbols;
  Map<double, List<int>> gapMap = {};
  double smallestNumber;
  double largestNumber;
  double expected;
  int total;
  List<StatInterval> gapIntervals = [];
  List<int> frequency = [];
  List<double> relativeFrequency = [];
  List<double> cumulativeFrequency = [];
  List<double> fOfx = [];
  List<double> fOfxMinusSOfx = [];
  double dCalc;

  GapCalculator({this.numbers, this.divFactor, this.gapLength}) {
    symbols = numbers.toSet().toList();
    symbols.sort();
    total = numbers.length - symbols.length;
    _populateGapMap();

    List<int> flattenedMapValues = gapMap.values.expand((i) => i).toList();

    largestNumber =
        double.parse(Utility.findLargestInt(flattenedMapValues).toString());
    smallestNumber = 0;

    gapIntervals = Utility.createIntervals(
        smallestNumber, largestNumber, gapLength, divFactor);

    gapIntervals.forEach((n) => n.printInterval());
    _calculateFreq();
    _calculateRelativeFreq();
    _calculateCumulativeFreq();
    _calculateFOfX();
    _calculateFOfxMinusSOfx();
    _claculateDCalc();
  }

  void _populateGapMap() {
    symbols.forEach((symbol) {
      List<int> ithGap = List();

      // Calculate gaps between numbers
      _calculateGaps(symbol, ithGap);

      // Remove the initial gap
      if (ithGap.isNotEmpty) ithGap.removeAt(0);

      // Add list to map
      gapMap[symbol] = List.from(ithGap);
    });
  }

  void _calculateGaps(double symbol, List<int> ithGap) {
    int prevIndex = 0;
    for (int i = 0; i < numbers.length; ++i) {
      if (symbol == numbers[i]) {
        ithGap.add(i - prevIndex - 1);
        prevIndex = i;
      }
    }
  }

  void _calculateFreq() {
    frequency = List.generate(gapIntervals.length,
        (int index) => _getFrequencyCount(gapIntervals[index]));
  }

  int _getFrequencyCount(StatInterval interval) {
    int count = 0;
    List flattenedMapValues = gapMap.values.expand((i) => i).toList();

    flattenedMapValues.forEach((number) {
      if (interval.start <= number && interval.end >= number) count++;
    });

    return count;
  }

  void _calculateRelativeFreq() {
    relativeFrequency = List.generate(frequency.length,
        (int index) => Utility.setPrecisionTo4(frequency[index] / total));
  }

  void _calculateCumulativeFreq() {
    cumulativeFrequency.add(relativeFrequency[0]);
    for (int i = 1; i < relativeFrequency.length; ++i) {
      double value = Utility.setPrecisionTo4(
          cumulativeFrequency[i - 1] + relativeFrequency[i]);
      cumulativeFrequency.add(value);
    }
  }

  void _calculateFOfX() {
    fOfx = List.generate(cumulativeFrequency.length, (int index) {
      int x = gapIntervals[index].end.floor();
      double value = 1 - pow(0.9, x + 1);
      return Utility.setPrecisionTo4(value);
    });
  }

  void _calculateFOfxMinusSOfx() {
    fOfxMinusSOfx = List.generate(
        cumulativeFrequency.length,
        (int index) => Utility.setPrecisionTo4(
            (fOfx[index] - cumulativeFrequency[index]).abs()));
  }

  void _claculateDCalc() {
    dCalc = Utility.findLargest(fOfxMinusSOfx);
  }
}
