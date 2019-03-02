import 'package:flutter/material.dart';
import 'package:stat_tests/widgets/table_column.dart';
import 'package:stat_tests/widgets/custom_appbar.dart';
import 'package:stat_tests/widgets/single_value_card.dart';
import 'package:stat_tests/ks_test/ks_calculator.dart';

class KSResultsScreen extends StatelessWidget {
  final KSCalculator calculator;

  KSResultsScreen({this.calculator});

  Widget _buildTable() => SizedBox(
        height: 50 + (calculator.numbers.length).toDouble() * 30.0,
        child: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            TableColumn(
              header: "R(i)",
              values: calculator.numbers,
            ),
            TableColumn(
              header: "i / N",
              values: calculator.iOverN,
            ),
            TableColumn(
              header: "i / N - R(i)",
              values: calculator.iOverNMinusRi,
            ),
            TableColumn(
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
