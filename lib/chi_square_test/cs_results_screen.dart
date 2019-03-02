import 'package:flutter/material.dart';
import 'package:stat_tests/widgets/table_column.dart';
import 'package:stat_tests/widgets/custom_appbar.dart';
import 'package:stat_tests/widgets/single_value_card.dart';
import 'package:stat_tests/chi_square_test/cs_calculator.dart';

class CSResultsScreen extends StatelessWidget {
  final CSCalculator calculator;

  CSResultsScreen({this.calculator});

  Widget _buildTable() => SizedBox(
        height: 50 + (calculator.intervals.length).toDouble() * 30.0,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            TableColumn(
              header: "Intervals",
              values: calculator.intervals,
            ),
            TableColumn(
              header: "Observed",
              values: calculator.observed,
            ),
            TableColumn(
              header: "Calculated",
              values: calculator.ithCalcValues,
            ),
          ],
        ),
      );

  Widget _buildResultsCards() => Column(
        children: <Widget>[
          SingleValueCard(
            value: "Expected = ${calculator.expected}",
          ),
          SingleValueCard(
            value: "Chi Square = ${calculator.chiSquareCalc}",
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
