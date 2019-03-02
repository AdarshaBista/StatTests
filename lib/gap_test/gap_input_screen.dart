import 'package:flutter/material.dart';
import 'package:stat_tests/utils/utility.dart';
import 'package:stat_tests/utils/input_validators.dart';
import 'package:stat_tests/widgets/custom_appbar.dart';
import 'package:stat_tests/widgets/custom_button.dart';
import 'package:stat_tests/widgets/page_transition.dart';
import 'package:stat_tests/widgets/custom_form_field.dart';
import 'package:stat_tests/gap_test/gap_calculator.dart';
import 'package:stat_tests/gap_test/gap_results_screen.dart';

class GapInputScreen extends StatefulWidget {
  @override
  GapInputScreenState createState() {
    return new GapInputScreenState();
  }
}

class GapInputScreenState extends State<GapInputScreen> {
  TextEditingController _numbersFieldController;
  TextEditingController _symbolsNumFieldController;
  TextEditingController _divFactorFieldController;
  TextEditingController _gapLengthFieldController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _numbersFieldController = TextEditingController();
    _symbolsNumFieldController = TextEditingController();
    _divFactorFieldController = TextEditingController();
    _gapLengthFieldController = TextEditingController();
  }

  @override
  void dispose() {
    _numbersFieldController.dispose();
    _symbolsNumFieldController.dispose();
    _divFactorFieldController.dispose();
    _gapLengthFieldController.dispose();
    super.dispose();
  }

  GapCalculator _getCalculator() {
    // Capture the string in text fields
    String numbersStr = _numbersFieldController.text.toString();
    String divFactorStr = _divFactorFieldController.text.toString();
    String gapLengthStr = _gapLengthFieldController.text.toString();

    // Convert the string to required types
    double divFactor = double.tryParse(divFactorStr) ?? 1.0;
    double gapLength = double.tryParse(gapLengthStr) ?? 1.0;
    List<double> numbers = Utility.toDoubleList(numbersStr);

    // Create a gap test calculator
    return GapCalculator(
      numbers: numbers,
      divFactor: divFactor,
      gapLength: gapLength,
    );
  }

  void onCalculateButtonPressed() {
    // Navigate to results page
    if (_formKey.currentState.validate()) {
      Navigator.push(
        context,
        SlideUpTransition(
          widget: GapResultsScreen(
            calculator: _getCalculator(),
          ),
        ),
      );
    }
  }

  Widget _buildNumbersInputField() => Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: CustomFormField(
          context: context,
          controller: _numbersFieldController,
          hintText: "Enter space separated Numbers",
          validator: (val) => InputValidators.validateNumbersField(val),
          maxLines: null,
        ),
      );

  Widget _buildDivFactorInputField() => Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: CustomFormField(
          context: context,
          controller: _divFactorFieldController,
          hintText: "Enter division factor",
          validator: (val) => InputValidators.validateNonZeroField(val),
        ),
      );

  Widget _buildGapLengthInputField() => Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: CustomFormField(
          context: context,
          controller: _gapLengthFieldController,
          hintText: "Enter gap length",
          validator: (val) => InputValidators.validateNonZeroPositiveField(val),
        ),
      );

  Widget _buildCalculateButton() => Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomButton(
          context: context,
          label: "Calculate",
          onPressed: onCalculateButtonPressed,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: CustomAppBar(
        context: context,
        title: "Gap Test",
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
            _buildNumbersInputField(),
            _buildDivFactorInputField(),
            _buildGapLengthInputField(),
            _buildCalculateButton(),
          ],
        ),
      ),
    );
  }
}
