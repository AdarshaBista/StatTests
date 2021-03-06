import 'package:flutter/material.dart';
import 'package:stat_tests/utils/input_validators.dart';
import 'package:stat_tests/widgets/custom_appbar.dart';
import 'package:stat_tests/widgets/custom_button.dart';
import 'package:stat_tests/widgets/page_transition.dart';
import 'package:stat_tests/widgets/custom_form_field.dart';
import 'package:stat_tests/poker_test/poker_calculator.dart';
import 'package:stat_tests/poker_test/poker_results_screen.dart';

class Poker4DigitInputScreen extends StatefulWidget {
  @override
  Poker4DigitInputScreenState createState() => Poker4DigitInputScreenState();
}

class Poker4DigitInputScreenState extends State<Poker4DigitInputScreen> {
  TextEditingController _allSameFieldController;
  TextEditingController _allDiffFieldController;
  TextEditingController _onePairFieldController;
  TextEditingController _twoPairFieldController;
  TextEditingController _threeSameFieldController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<int> _inputs = [];

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

  List<int> _prepareInputs() {
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

    return [allSame, allDiff, onePair, twoPair, threeSame];
  }

  Poker4DigitCalculator _getCalculator(List<int> inputs) {
    // Create a 4-digit poker test calculator
    return Poker4DigitCalculator(inputs);
  }

  void _onCalculateButtonPressed() {
    _inputs = _prepareInputs();
    // Navigate to results page
    if (_formKey.currentState.validate()) {
      Navigator.push(
        context,
        SlideUpTransition(
          widget: Poker4DigitResultsScreen(
            calculator: _getCalculator(_inputs),
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
          validator: (val) =>
              InputValidators.validatePositiveIntField(val, _inputs),
        ),
      );

  Widget _buildAllDifferentInputField() => Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: CustomFormField(
          context: context,
          controller: _allDiffFieldController,
          hintText: "All different",
          validator: (val) =>
              InputValidators.validatePositiveIntField(val, _inputs),
        ),
      );

  Widget _build1PairInputField() => Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: CustomFormField(
          context: context,
          controller: _onePairFieldController,
          hintText: "1 pair",
          validator: (val) =>
              InputValidators.validatePositiveIntField(val, _inputs),
        ),
      );

  Widget _build2PairInputField() => Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: CustomFormField(
          context: context,
          controller: _twoPairFieldController,
          hintText: "2 pair",
          validator: (val) =>
              InputValidators.validatePositiveIntField(val, _inputs),
        ),
      );

  Widget _build3SameInputField() => Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: CustomFormField(
          context: context,
          controller: _threeSameFieldController,
          hintText: "3 same",
          validator: (val) =>
              InputValidators.validatePositiveIntField(val, _inputs),
        ),
      );

  Widget _buildCalculateButton() => Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomButton(
          context: context,
          label: "Calculate",
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
