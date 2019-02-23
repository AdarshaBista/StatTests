import 'package:flutter/material.dart';
import 'package:stat_tests/widgets/custom_appbar.dart';
import 'package:stat_tests/gap_test/gap_calculator.dart';
import 'package:stat_tests/gap_test/gap_result_card.dart';

class GapResultsScreen extends StatelessWidget {
  final GapCalculator calculator;

  GapResultsScreen({this.calculator});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: "Results",
      ),
      body: Container(
        height: MediaQuery.of(context).size.height / 4,
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
      ),
    );
  }
}
