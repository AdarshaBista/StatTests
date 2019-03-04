import 'package:stat_tests/utils/utility.dart';

class KSCalculator {
  List<double> numbers;
  final double divFactor;

  List<double> _iOverN = [];
  List<double> _iOverNMinusRi = [];
  List<double> _riMinusIMinusOneOverN = [];
  double _dPlus;
  double _dMinus;
  double _d;

  List<double> get iOverN => _iOverN;
  List<double> get iOverNMinusRi => _iOverNMinusRi;
  List<double> get riMinusIMinusOneOverN => _riMinusIMinusOneOverN;
  double get dPlus => _dPlus;
  double get dMinus => _dMinus;
  double get d => _d;

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
      _iOverN.add(Utility.setPrecisionTo4(value));
    }
  }

  void _calculateIOverNMinusRi() {
    for (int i = 0; i < numbers.length; ++i) {
      double value = _iOverN[i] - numbers[i];
      _iOverNMinusRi.add(Utility.setPrecisionTo4(value));
    }
  }

  void _calculaterRiMinusIMinusOneOverN() {
    _riMinusIMinusOneOverN.add(Utility.setPrecisionTo4(numbers[0]));

    for (int i = 1; i < numbers.length; ++i) {
      double value = numbers[i] - (_iOverN[i - 1]);
      _riMinusIMinusOneOverN.add(Utility.setPrecisionTo4(value));
    }
  }

  void _calculateD() {
    _dPlus = Utility.findLargest(_iOverNMinusRi);
    _dMinus = Utility.findLargest(_riMinusIMinusOneOverN);
    _d = _dPlus > _dMinus ? _dPlus : _dMinus;
  }
}
