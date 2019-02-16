import 'package:stat_tests/utils/utility.dart';

class KSCalculator {
  final double divFactor;

  List<double> numbers;
  List<double> iOverN = [];
  List<double> iOverNMinusRi = [];
  List<double> riMinusIMinusOneOverN = [];

  double dPlus;
  double dMinus;
  double d;

  KSCalculator({this.numbers, this.divFactor}) {
    numbers.sort();
    _calculateIOverN();
    _calculateIOverNMinusRi();
    _calculaterRiMinusIMinusOneOverN();
    _calculateD();
  }

  void _calculateIOverN() {
    int n = numbers.length;
    for (int i = 1; i <= n; ++i) {
      double value = i / n;
      iOverN.add(Utility.setPrecisionTo4(value));
    }
  }

  void _calculateIOverNMinusRi() {
    for (int i = 0; i < numbers.length; ++i) {
      double value = iOverN[i] - numbers[i];
      iOverNMinusRi.add(Utility.setPrecisionTo4(value));
    }
  }

  void _calculaterRiMinusIMinusOneOverN() {
    riMinusIMinusOneOverN.add(numbers[0]);

    for (int i = 1; i < numbers.length; ++i) {
      double value = numbers[i] - (iOverN[i - 1]);
      riMinusIMinusOneOverN.add(Utility.setPrecisionTo4(value));
    }
  }

  void _calculateD() {
    dPlus = Utility.findLargest(iOverNMinusRi);
    dMinus = Utility.findLargest(riMinusIMinusOneOverN);
    d = dPlus > dMinus ? dPlus : dMinus;
  }
}
