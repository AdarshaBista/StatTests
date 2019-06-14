import 'package:flutter/material.dart';
import 'package:stat_tests/chi_square_test/cs_input_screen.dart';
import 'package:stat_tests/ks_test/ks_input_screen.dart';
import 'package:stat_tests/gap_test/gap_input_screen.dart';
import 'package:stat_tests/auto_correlation_test/ac_input_screen.dart';
import 'package:stat_tests/poker_test/poker_digit_input_screen.dart';

class TestListScreen extends StatefulWidget {
  @override
  TestListScreenState createState() => TestListScreenState();
}

class TestListScreenState extends State<TestListScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
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
      bottomNavigationBar: Material(
        color: Theme.of(context).primaryColor,
        child: TabBar(
          controller: _tabController,
          isScrollable: true,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Colors.white,
          indicatorPadding: EdgeInsets.only(bottom: 6.0),
          labelStyle:
              Theme.of(context).textTheme.subhead.copyWith(color: Colors.white),
          tabs: <Widget>[
            Tab(text: "Chi Square"),
            Tab(text: "Kolmogorov Smirnov"),
            Tab(text: "Gap"),
            Tab(text: "Auto Correlation"),
            Tab(text: "Poker"),
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
