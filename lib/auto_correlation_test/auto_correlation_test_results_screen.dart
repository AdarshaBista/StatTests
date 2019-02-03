import 'package:flutter/material.dart';
import '../widgets/custom_appbar.dart';
import './auto_correlation_test_results.dart';
import './auto_correlation_test_result_card.dart';

class AutoCorrelationTestResultsScreen extends StatelessWidget {
  int capitalM;
  double sigmaRhoIm;
  double sum;
  double rhoIm;
  double zCalc;

  AutoCorrelationTestResultsScreen() {
    capitalM = AutoCorrelationTestResults.capitalM;
    sigmaRhoIm = AutoCorrelationTestResults.sigmaRhoIm;
    sum = AutoCorrelationTestResults.summation;
    rhoIm = AutoCorrelationTestResults.rhoIm;
    zCalc = AutoCorrelationTestResults.calculateZcalc();
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
            title: "Sum = $sum",
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
