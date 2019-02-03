import '../utils/utility.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import '../widgets/custom_appbar.dart';
import './auto_correlation_test_result_card.dart';

class AutoCorrelationTestResults extends StatelessWidget {
  double divFactor;
  static List<double> numbers;
  static int ithNumber;
  static int lag;

  static int capitalM;
  static double sigmaRhoIm;
  static double rhoIm;
  static double summation;
  static double zCalc;

  AutoCorrelationTestResults(String numbersStr, String divFactorStr,
      String ithNumberStr, String lagStr) {
    divFactor = double.tryParse(divFactorStr) ?? 1.0;
    numbers = Utility.converStrToList(numbersStr, divFactor);
    ithNumber = (int.tryParse(ithNumberStr) - 1) ?? 0;
    lag = int.tryParse(lagStr) ?? 5;

    calculateCapitalM();
    calculateSigmaRhoIm();
    calculateRhoIm();
    calculateZcalc();
  }

  static void calculateCapitalM() {
    capitalM = (numbers.length - lag - ithNumber) ~/ lag;
  }

  static void calculateSigmaRhoIm() {
    double numerator = sqrt(13 * capitalM + 7);
    double denominator = 12 * (capitalM + 1.0);
    sigmaRhoIm = numerator / denominator;
  }

  static void calculateRhoIm() {
    double oneOverMPlusOne = 1.0 / (capitalM + 1.0);

    double sum = 0.0;
    for (int k = 0; k <= capitalM; ++k) {
      double firstNum = numbers[ithNumber + k * lag];
      double secondNum = numbers[ithNumber + (k + 1) * lag];

      sum += (firstNum * secondNum);
    }
    summation = sum;
    rhoIm = oneOverMPlusOne * sum - 0.25;
  }

  static double calculateZcalc() {
    zCalc = rhoIm / sigmaRhoIm;
    return zCalc;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: "Results",
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        itemExtent: 90.0,
        shrinkWrap: true,
        children: <Widget>[
          AutoCorrelationTestResultCard(
            title: "M = $capitalM",
          ),
          AutoCorrelationTestResultCard(
            title: "Sum = $summation",
          ),
          AutoCorrelationTestResultCard(
            title: "Rho = $rhoIm",
          ),
          AutoCorrelationTestResultCard(
            title: "Sigma Rho = $sigmaRhoIm",
          ),
          AutoCorrelationTestResultCard(
            title: "Zo = $zCalc",
          ),
        ],
      ),
    );
  }
}
