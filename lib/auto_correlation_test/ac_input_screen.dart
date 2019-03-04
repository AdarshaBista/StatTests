import 'package:flutter/material.dart';
import 'package:stat_tests/utils/utility.dart';
import 'package:stat_tests/utils/input_validators.dart';
import 'package:stat_tests/widgets/custom_appbar.dart';
import 'package:stat_tests/widgets/custom_button.dart';
import 'package:stat_tests/widgets/page_transition.dart';
import 'package:stat_tests/widgets/custom_form_field.dart';
import 'package:stat_tests/auto_correlation_test/ac_calculator.dart';
import 'package:stat_tests/auto_correlation_test/ac_results_screen.dart';

class ACInputScreen extends StatefulWidget {
  @override
  ACInputScreenState createState() {
    return new ACInputScreenState();
  }
}

class ACInputScreenState extends State<ACInputScreen> {
  TextEditingController _numbersFieldController;
  TextEditingController _divFactorFieldController;
  TextEditingController _ithNumberFieldController;
  TextEditingController _lagFieldController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int _totalNumbers = 0;
  int _ithNumber = 1;
  int _lag = 0;

  @override
  void initState() {
    super.initState();
    _numbersFieldController = TextEditingController();
    _divFactorFieldController = TextEditingController();
    _ithNumberFieldController = TextEditingController();
    _lagFieldController = TextEditingController();
  }

  @override
  void dispose() {
    _numbersFieldController.dispose();
    _divFactorFieldController.dispose();
    _ithNumberFieldController.dispose();
    _lagFieldController.dispose();
    super.dispose();
  }

  Map<String, dynamic> _prepareInput() {
    // Capture the string in text fields
    String numbersStr = _numbersFieldController.text.toString();
    String divFactorStr = _divFactorFieldController.text.toString();
    String ithNumberStr = _ithNumberFieldController.text.toString();
    String lagStr = _lagFieldController.text.toString();

    // Convert the string to required types
    double divFactor = double.tryParse(divFactorStr) ?? 1.0;
    int ithNumber = (int.tryParse(ithNumberStr)) ?? 1;
    int lag = int.tryParse(lagStr) ?? 2;
    List<double> numbers = Utility.toDoubleList(numbersStr, divFactor);
    _totalNumbers = numbers.length;

    return {
      'numbers': numbers,
      'divFactor': divFactor,
      'ithNumber': ithNumber,
      'lag': lag,
    };
  }

  ACCalculator _getCalculator(Map<String, dynamic> inputs) {
    // Create a auto correlation test calculator
    return ACCalculator(
      numbers: inputs['numbers'],
      divFactor: inputs['divFactor'],
      ithNumber: inputs['ithNumber'],
      lag: inputs['lag'],
    );
  }

  void _onCalculateButtonPressed() {
    Map<String, dynamic> inputs = _prepareInput();
    _ithNumber = inputs['ithNumber'];
    _lag = inputs['lag'];

    // Navigate to results page
    if (_formKey.currentState.validate()) {
      Navigator.push(
        context,
        SlideUpTransition(
          widget: ACResultsScreen(
            calculator: _getCalculator(inputs),
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

  Widget _buildIthNumberInputField() => Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: CustomFormField(
          context: context,
          controller: _ithNumberFieldController,
          hintText: "Enter ith number",
          validator: (val) => InputValidators.validateNonZeroPositiveIntField(
              val, _totalNumbers - _lag),
        ),
      );

  Widget _buildLagInputField() => Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: CustomFormField(
          context: context,
          controller: _lagFieldController,
          hintText: "Enter lag",
          validator: (val) => InputValidators.validateNonZeroPositiveIntField(
              val, _totalNumbers - _ithNumber),
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
        title: "Auto Correlation Test",
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
            _buildIthNumberInputField(),
            _buildLagInputField(),
            _buildCalculateButton(),
          ],
        ),
      ),
    );
  }
}
