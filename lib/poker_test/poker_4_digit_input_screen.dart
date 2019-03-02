import 'package:flutter/material.dart';
import 'package:stat_tests/utils/page_transition.dart';
import 'package:stat_tests/utils/input_validators.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
    String allSameStr = _allSameFieldController.text.toString();
    String allDiffStr = _allDiffFieldController.text.toString();
    String onePairStr = _onePairFieldController.text.toString();
    String twoPairStr = _twoPairFieldController.text.toString();
    String threeSameStr = _threeSameFieldController.text.toString();

    // Convert the string to required types
    int allSame = int.tryParse(allSameStr) ?? 0;
    int allDiff = int.tryParse(allDiffStr) ?? 0;
    int onePair = int.tryParse(onePairStr) ?? 0;
    int twoPair = int.tryParse(twoPairStr) ?? 0;
    int threeSame = int.tryParse(threeSameStr) ?? 0;

    // Create a 4-digit poker test calculator
    return Poker4DigitCalculator(
      allSame: allSame,
      allDiff: allDiff,
      onePair: onePair,
      twoPair: twoPair,
      threeSame: threeSame,
    );
  }

  void _onCalculateButtonPressed() {
    // Navigate to results page
    if (_formKey.currentState.validate()) {
      Navigator.push(
        context,
        SlideUpTransition(
          widget: Poker4DigitResultsScreen(
            calculator: _getCalculator(),
          ),
        ),
      );
    }
  }

  Widget _buildAllSameInputField() => Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: CustomFormField(
          context: context,
          controller: _allSameFieldController,
          hintText: "All same",
          validator: (val) => InputValidators.validatePositiveField(val),
        ),
      );

  Widget _buildAllDifferentInputField() => Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: CustomFormField(
          context: context,
          controller: _allDiffFieldController,
          hintText: "All different",
          validator: (val) => InputValidators.validatePositiveField(val),
        ),
      );

  Widget _build1PairInputField() => Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: CustomFormField(
          context: context,
          controller: _onePairFieldController,
          hintText: "1 pair",
          validator: (val) => InputValidators.validatePositiveField(val),
        ),
      );

  Widget _build2PairInputField() => Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: CustomFormField(
          context: context,
          controller: _twoPairFieldController,
          hintText: "2 pair",
          validator: (val) => InputValidators.validatePositiveField(val),
        ),
      );

  Widget _build3SameInputField() => Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: CustomFormField(
          context: context,
          controller: _threeSameFieldController,
          hintText: "3 same",
          validator: (val) => InputValidators.validatePositiveField(val),
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
      body: Form(
        key: _formKey,
        child: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: 30.0,
            vertical: 20.0,
          ),
          children: <Widget>[
            _buildAllSameInputField(),
            _buildAllDifferentInputField(),
            _build1PairInputField(),
            _build2PairInputField(),
            _build3SameInputField(),
            _buildCalculateButton(),
          ],
        ),
      ),
    );
  }
}
