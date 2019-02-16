import 'package:flutter/material.dart';
import 'package:stat_tests/utils/utility.dart';
import 'package:stat_tests/widgets/custom_appbar.dart';
import 'package:stat_tests/chi_square_test/cs_calculator.dart';
import 'package:stat_tests/chi_square_test/cs_result_column.dart';
import 'package:stat_tests/chi_square_test/cs_result_card.dart';

class CSResultsScreen extends StatelessWidget {
  final CSCalculator calculator;

  CSResultsScreen({this.calculator});

  Widget _buildTable() => SizedBox(
        height: (calculator.observed.length + 2).toDouble() * 30.0,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            CSResultColumn(
              columnId: 1,
              title: "Intervals",
              values: calculator.observed,
            ),
            CSResultColumn(
              columnId: 2,
              title: "Observed",
              values: calculator.observed,
            ),
            CSResultColumn(
              columnId: 3,
              title: "Calculated",
              values: calculator.ithCalcValues,
            ),
          ],
        ),
      );

  Widget _buildResultsCards() => Column(
        children: <Widget>[
          CSResultCard(
            title: "Expected = ${calculator.expected}",
          ),
          CSResultCard(
            title:
                "Chi Square = ${Utility.setPrecisionTo4(calculator.calculateChiSquare())}",
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
