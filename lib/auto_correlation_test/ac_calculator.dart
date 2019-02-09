import 'dart:math';

class ACCalculator {
  final double divFactor;
  final List<double> numbers;
  final int ithNumber;
  final int lag;

  ACCalculator({this.numbers, this.divFactor, this.ithNumber, this.lag});

  int calculateCapitalM() {
    int capitalM = (numbers.length - lag - ithNumber) ~/ lag;
    return capitalM;
  }

  double calculateSigmaRhoIm(int capitalM) {
    double numerator = sqrt(13 * capitalM + 7);
    double denominator = 12 * (capitalM + 1.0);
    double sigmaRhoIm = numerator / denominator;
    return sigmaRhoIm;
  }

  double calculateRhoIm(int capitalM) {
    double oneOverMPlusOne = 1.0 / (capitalM + 1.0);

    double sum = 0.0;
    for (int k = 0; k <= capitalM; ++k) {
      double firstNum = numbers[ithNumber + k * lag];
      double secondNum = numbers[ithNumber + (k + 1) * lag];

      sum += (firstNum * secondNum);
    }
    double rhoIm = oneOverMPlusOne * sum - 0.25;
    return rhoIm;
  }

  double calculateZcalc(double rhoIm, double sigmaRhoIm) {
    double zCalc = rhoIm / sigmaRhoIm;
    return zCalc;
  }
}
