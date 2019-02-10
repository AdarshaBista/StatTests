import 'package:flutter/material.dart';
import 'package:stat_tests/widgets/custom_appbar.dart';

class PokerInputScreen extends StatefulWidget {
  @override
  PokerInputScreenState createState() {
    return new PokerInputScreenState();
  }
}

class PokerInputScreenState extends State<PokerInputScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: CustomAppBar(
        context: context,
        title: "Poker Test",
      ),
    );
  }
}
