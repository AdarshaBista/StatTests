import 'package:flutter/material.dart';
import './widgets/test_card.dart';
import './widgets/custom_appbar.dart';
import './gap_test/gap_test_screen.dart';
import './auto_correlation_test/auto_correlation_test_screen.dart';

class TestListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: "Choose a Test",
      ),
      body: ListView(
        shrinkWrap: true,
        itemExtent: 100.0,
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          TestCard(
            title: "Chi Square Test",
            bgPath: "",
            onPressed: null,
          ),
          TestCard(
            title: "KS Test",
            bgPath: "",
            onPressed: null,
          ),
          TestCard(
            title: "Gap Test",
            bgPath: "",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GapTestScreen(),
                ),
              );
            },
          ),
          TestCard(
            title: "Auto Correlation Test",
            bgPath: "",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AutoCorrelationTestScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
