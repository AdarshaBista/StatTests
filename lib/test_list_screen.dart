import 'package:flutter/material.dart';
import './widgets/custom_appbar.dart';
import './gap_test/gap_input_screen.dart';
import './auto_correlation_test/ac_input_screen.dart';

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
          indicatorSize: TabBarIndicatorSize.tab,
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              text: "GT",
            ),
            Tab(
              text: "ACT",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          GapInputScreen(),
          ACInputScreen(),
        ],
      ),
    );
  }
}
