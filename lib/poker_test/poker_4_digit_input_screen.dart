import 'package:flutter/material.dart';
import 'package:stat_tests/widgets/custom_appbar.dart';
import 'package:stat_tests/widgets/custom_button.dart';
import 'package:stat_tests/widgets/custom_form_field.dart';
import 'package:stat_tests/poker_test/poker_calculator.dart';
import 'package:stat_tests/poker_test/poker_results_screen.dart';

class Poker4DigitInputScreen extends StatefulWidget {
  @override
  Poker4DigitInputScreenState createState() {
    return new Poker4DigitInputScreenState();
  }
}

class Poker4DigitInputScreenState extends State<Poker4DigitInputScreen> {
  TextEditingController _allSameFieldController;
  TextEditingController _allDiffFieldController;
  TextEditingController _onePairFieldController;
  TextEditingController _twoPairFieldController;
  TextEditingController _threeSameFieldController;

  @override
  void initState() {
    super.initState();
    _allSameFieldController = TextEditingController();
    _allDiffFieldController = TextEditingController();
    _onePairFieldController = TextEditingController();
    _twoPairFieldController = TextEditingController();
    _threeSameFieldController = TextEditingController();
  }

  @override
  void dispose() {
    _allSameFieldController.dispose();
    _allDiffFieldController.dispose();
    _onePairFieldController.dispose();
    _twoPairFieldController.dispose();
    _threeSameFieldController.dispose();
    super.dispose();
  }

  Poker4DigitCalculator _getCalculator() {
    // Capture the string in text fields
    String _allSameStr = _allSameFieldController.text.toString();
    String _allDiffStr = _allDiffFieldController.text.toString();
    String _onePairStr = _onePairFieldController.text.toString();
    String _twoPairStr = _twoPairFieldController.text.toString();
    String _threeSameStr = _threeSameFieldController.text.toString();

    // Convert the string to required types
    int _allSame = int.tryParse(_allSameStr) ?? 0;
    int _allDiff = int.tryParse(_allDiffStr) ?? 0;
    int _onePair = int.tryParse(_onePairStr) ?? 0;
    int _twoPair = int.tryParse(_twoPairStr) ?? 0;
    int _threeSame = int.tryParse(_threeSameStr) ?? 0;

    // Create a poker test calculator
    return Poker4DigitCalculator(
      allSame: _allSame,
      allDiff: _allDiff,
      onePair: _onePair,
      twoPair: _twoPair,
      threeSame: _threeSame,
    );
  }

  void _onCalculateButtonPressed() {
    // Navigate to results page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Poker4DigitResultsScreen(
              calculator: _getCalculator(),
            ),
      ),
    );
  }

  Widget _buildAllSameInputField() => Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: CustomFormField(
          context: context,
          controller: _allSameFieldController,
          hintText: "All same",
        ),
      );

  Widget _buildAllDifferentInputField() => Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: CustomFormField(
          context: context,
          controller: _allDiffFieldController,
          hintText: "All different",
        ),
      );

  Widget _build1PairInputField() => Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: CustomFormField(
          context: context,
          controller: _onePairFieldController,
          hintText: "1 pair",
        ),
      );

  Widget _build2PairInputField() => Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: CustomFormField(
          context: context,
          controller: _twoPairFieldController,
          hintText: "2 pair",
        ),
      );

  Widget _build3SameInputField() => Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: CustomFormField(
          context: context,
          controller: _threeSameFieldController,
          hintText: "3 same",
        ),
      );

  Widget _buildCalculateButton() => Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomButton(
          context: context,
          text: "Calculate",
          onPressed: _onCalculateButtonPressed,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: "Poker Test",
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 10.0,
        ),
        children: <Widget>[
          _buildAllSameInputField(),
          _buildAllDifferentInputField(),
          _build1PairInputField(),
          _build3SameInputField(),
          _build2PairInputField(),
          _buildCalculateButton(),
        ],
      ),
    );
  }
}
