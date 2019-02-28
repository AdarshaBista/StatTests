import 'package:flutter/material.dart';
import 'package:stat_tests/utils/stat_interval.dart';
import 'package:stat_tests/utils/utility.dart';
import 'package:stat_tests/widgets/custom_appbar.dart';
import 'package:stat_tests/widgets/single_value_card.dart';
import 'package:stat_tests/chi_square_test/cs_calculator.dart';
import 'package:stat_tests/widgets/table_column.dart';

class CSResultsScreen extends StatelessWidget {
  final CSCalculator calculator;

  CSResultsScreen({this.calculator});

  List<String> _getIntervalList() {
    List<StatInterval> intervals = calculator.intervals;
    List<String> observedStrList = List.generate(
        intervals.length,
        (int index) => (intervals[index].start.toString() +
            " - " +
            intervals[index].end.toString()));
    return observedStrList;
  }

  Widget _buildTable() => SizedBox(
        height: (calculator.intervals.length + 2).toDouble() * 30.0,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            TableColumn(
              header: "Intervals",
              values: _getIntervalList(),
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
            value:
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
