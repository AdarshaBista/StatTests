import 'package:flutter/material.dart';
import 'package:stat_tests/utils/stat_interval.dart';
import 'package:stat_tests/utils/utility.dart';
import 'package:stat_tests/widgets/custom_appbar.dart';
import 'package:stat_tests/gap_test/gap_calculator.dart';
import 'package:stat_tests/gap_test/gap_result_card.dart';
import 'package:stat_tests/widgets/single_value_card.dart';
import 'package:stat_tests/widgets/table_column.dart';

class GapResultsScreen extends StatelessWidget {
  final GapCalculator calculator;

  GapResultsScreen({this.calculator});

  List<String> _getGapInterval() {
    List<StatInterval> intervals = calculator.gapIntervals;
    List<String> observedStrList = List.generate(
        intervals.length,
        (int index) => (intervals[index].start.toString() +
            " - " +
            intervals[index].end.toString()));
    return observedStrList;
  }

  Widget _buildGapsCard() => Container(
        height: 160,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: calculator.gapMap.length,
          itemBuilder: (BuildContext context, int index) {
            double key = calculator.gapMap.keys.elementAt(index);
            return GapResultCard(
              title: key.toString(),
              list: calculator.gapMap[key].toString(),
              listSize: calculator.gapMap[key].length.toString(),
            );
          },
        ),
      );

  Widget _buildTable() => SizedBox(
        height: (calculator.gapIntervals.length + 2).toDouble() * 30.0,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            TableColumn(
              header: "Gap Length",
              values: _getGapInterval(),
            ),
            TableColumn(
              header: "Frequency",
              values: calculator.frequency,
            ),
            TableColumn(
              header: "Relative Frequency",
              values: calculator.relativeFrequency,
            ),
            TableColumn(
              header: "Cumulative Frequency",
              values: calculator.cumulativeFrequency,
            ),
            TableColumn(
              header: "F(x)",
              values: calculator.fOfx,
            ),
            TableColumn(
              header: "|F(x) - Sn(x)|",
              values: calculator.fOfxMinusSOfx,
            ),
          ],
        ),
      );

  Widget _buildResultsCard() => SingleValueCard(
        value: "D = ${calculator.dCalc}",
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
          _buildGapsCard(),
          _buildTable(),
          _buildResultsCard(),
        ],
      ),
    );
  }
}
