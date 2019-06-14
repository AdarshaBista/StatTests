import 'package:flutter/material.dart';
import 'package:stat_tests/utils/utility.dart';
import 'package:stat_tests/utils/input_validators.dart';
import 'package:stat_tests/widgets/custom_appbar.dart';
import 'package:stat_tests/widgets/custom_button.dart';
import 'package:stat_tests/widgets/page_transition.dart';
import 'package:stat_tests/widgets/custom_form_field.dart';
import 'package:stat_tests/chi_square_test/cs_calculator.dart';
import 'package:stat_tests/chi_square_test/cs_results_screen.dart';

class CSInputScreen extends StatefulWidget {
  @override
  CSInputScreenState createState() => CSInputScreenState();
}

class CSInputScreenState extends State<CSInputScreen> {
  TextEditingController _numbersFieldController;
  TextEditingController _divFactorFieldController;
  TextEditingController _intervalWidthFieldController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _numbersFieldController = TextEditingController();
    _divFactorFieldController = TextEditingController();
    _intervalWidthFieldController = TextEditingController();
  }

  @override
  void dispose() {
    _numbersFieldController.dispose();
    _divFactorFieldController.dispose();
    _intervalWidthFieldController.dispose();
    super.dispose();
  }

  CSCalculator _getCalculator() {
    // Capture the string in text fields
    String numbersStr = _numbersFieldController.text.toString();
    String divFactorStr = _divFactorFieldController.text.toString();
    String intervalWidthStr = _intervalWidthFieldController.text.toString();

    // Convert the string to required types
    double divFactor = double.tryParse(divFactorStr) ?? 1.0;
    double intervalWidth = double.tryParse(intervalWidthStr) ?? 1.0;
    List<double> numbers = Utility.toDoubleList(numbersStr, divFactor);

    // Create a chi square test calculator
    return CSCalculator(
      numbers: numbers,
      divFactor: divFactor,
      intervalWidth: intervalWidth,
    );
  }

  void _onCalculateButtonPressed() {
    // Navigate to results page
    if (_formKey.currentState.validate()) {
      Navigator.push(
        context,
        SlideUpTransition(
          widget: CSResultsScreen(
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

  Widget _buildIntervalWidthInputField() => Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: CustomFormField(
          context: context,
          controller: _intervalWidthFieldController,
          hintText: "Enter interval width",
          validator: (val) => InputValidators.validateNonZeroPositiveField(val),
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
      resizeToAvoidBottomPadding: false,
      appBar: CustomAppBar(
        context: context,
        title: "Chi Square Test",
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
            _buildIntervalWidthInputField(),
            _buildCalculateButton(),
          ],
        ),
      ),
    );
  }
}
