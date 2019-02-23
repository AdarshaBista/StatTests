import 'package:flutter/material.dart';
import 'package:stat_tests/widgets/custom_appbar.dart';
import 'package:stat_tests/widgets/single_value_card.dart';
import 'package:stat_tests/ks_test/ks_calculator.dart';
import 'package:stat_tests/ks_test/ks_result_column.dart';

class KSResultsScreen extends StatelessWidget {
  final KSCalculator calculator;

  KSResultsScreen({this.calculator});

  Widget _buildTable() => SizedBox(
        height: (calculator.numbers.length + 2).toDouble() * 30.0,
        child: ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            KSResultColumn(
              header: "R(i)",
              values: calculator.numbers,
            ),
            KSResultColumn(
              header: "i / N",
              values: calculator.iOverN,
            ),
            KSResultColumn(
              header: "i / N - R(i)",
              values: calculator.iOverNMinusRi,
            ),
            KSResultColumn(
              header: "R(i) - (i-1) / N",
              values: calculator.riMinusIMinusOneOverN,
            ),
          ],
        ),
      );

  Widget _buildResultsCards() => Column(
        children: <Widget>[
          SingleValueCard(
            value: "D+ = ${calculator.dPlus}",
          ),
          SingleValueCard(
            value: "D- = ${calculator.dMinus}",
          ),
          SingleValueCard(
            value: "D = ${calculator.d}",
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: "Results",
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          _buildTable(),
          _buildResultsCards(),
        ],
      ),
    );
  }
}
