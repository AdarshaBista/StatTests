import 'package:flutter/material.dart';
import 'package:stat_tests/widgets/custom_appbar.dart';
import 'package:stat_tests/widgets/custom_button.dart';
import 'package:stat_tests/poker_test/poker_4_digit_input_screen.dart';
import 'package:stat_tests/poker_test/poker_3_digit_input_screen.dart';

class PokerDigitInputScreen extends StatefulWidget {
  @override
  PokerDigitInputScreenState createState() => PokerDigitInputScreenState();
}

class PokerDigitInputScreenState extends State<PokerDigitInputScreen> {
  void _on3DigitButtonPressed() {
    // Navigate to 3 digit input page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Poker3DigitInputScreen(),
      ),
    );
  }

  void _on4DigitButtonPressed() {
    // Navigate to 4 digit input page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Poker4DigitInputScreen(),
      ),
    );
  }

  Widget _build3DigitButton() => Padding(
        padding: const EdgeInsets.all(12.0),
        child: CustomButton(
          context: context,
          label: "3 digits",
          onPressed: _on3DigitButtonPressed,
        ),
      );

  Widget _build4DigitButton() => Padding(
        padding: const EdgeInsets.all(12.0),
        child: CustomButton(
          context: context,
          label: "4 digits",
          onPressed: _on4DigitButtonPressed,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: CustomAppBar(
        context: context,
        title: "Poker Test",
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: 40.0,
          vertical: 20.0,
        ),
        children: <Widget>[
          _build3DigitButton(),
          _build4DigitButton(),
        ],
      ),
    );
  }
}
