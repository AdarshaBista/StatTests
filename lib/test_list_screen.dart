import 'package:flutter/material.dart';
import 'package:stat_tests/widgets/custom_appbar.dart';
import 'package:stat_tests/chi_square_test/cs_input_screen.dart';
import 'package:stat_tests/ks_test/ks_input_screen.dart';
import 'package:stat_tests/gap_test/gap_input_screen.dart';
import 'package:stat_tests/auto_correlation_test/ac_input_screen.dart';
import 'package:stat_tests/poker_test/poker_digit_input_screen.dart';

class TestListScreen extends StatefulWidget {
  @override
  TestListScreenState createState() {
    return new TestListScreenState();
  }
}

class TestListScreenState extends State<TestListScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(
      length: 5,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: "Choose a Test",
      ),
      bottomNavigationBar: Material(
        color: Theme.of(context).primaryColor,
        child: TabBar(
          indicatorSize: TabBarIndicatorSize.label,
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              text: "CST",
            ),
            Tab(
              text: "KST",
            ),
            Tab(
              text: "GT",
            ),
            Tab(
              text: "ACT",
            ),
            Tab(
              text: "PT",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          CSInputScreen(),
          KSInputScreen(),
          GapInputScreen(),
          ACInputScreen(),
          PokerDigitInputScreen(),
        ],
      ),
    );
  }
}
