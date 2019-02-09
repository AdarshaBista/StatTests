import 'package:flutter/material.dart';
import './widgets/test_list_card.dart';
import './widgets/custom_appbar.dart';
import './gap_test/gap_input_screen.dart';
import './auto_correlation_test/ac_input_screen.dart';

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
          TestListCard(
            title: "Chi Square Test",
            bgPath: "",
            onPressed: null,
          ),
          TestListCard(
            title: "KS Test",
            bgPath: "",
            onPressed: null,
          ),
          TestListCard(
            title: "Gap Test",
            bgPath: "",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GapInputScreen(),
                ),
              );
            },
          ),
          TestListCard(
            title: "Auto Correlation Test",
            bgPath: "",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ACInputScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
