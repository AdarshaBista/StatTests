import 'package:flutter/material.dart';
import 'package:stat_tests/utils/page_transition.dart';
import 'package:stat_tests/utils/utility.dart';
import 'package:stat_tests/widgets/custom_appbar.dart';
import 'package:stat_tests/widgets/custom_form_field.dart';
import 'package:stat_tests/widgets/custom_button.dart';
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

  ACCalculator _getCalculator() {
    // Capture the string in text fields
    String _numbersStr = _numbersFieldController.text.toString();
    String _divFactorStr = _divFactorFieldController.text.toString();
    String _ithNumberStr = _ithNumberFieldController.text.toString();
    String _lagStr = _lagFieldController.text.toString();

    // Convert the string to required types
    double _divFactor = double.tryParse(_divFactorStr) ?? 1.0;
    int _ithNumber = (int.tryParse(_ithNumberStr) - 1) ?? 0;
    int _lag = int.tryParse(_lagStr) ?? 1;
    List<double> _numbers = Utility.converStrToList(_numbersStr, _divFactor);

    // Create a auto correlation test calculator
    return ACCalculator(
        numbers: _numbers,
        divFactor: _divFactor,
        ithNumber: _ithNumber,
        lag: _lag);
  }

  void _onCalculateButtonPressed() {
    // Navigate to results page
    if (_formKey.currentState.validate()) {
      Navigator.push(
        context,
        SlideUpTransition(
          widget: ACResultsScreen(
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
          maxLines: 3,
        ),
      );

  Widget _buildDivFactorInputField() => Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: CustomFormField(
          context: context,
          controller: _divFactorFieldController,
          hintText: "Enter division factor",
        ),
      );

  Widget _buildIthNumberInputField() => Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: CustomFormField(
          context: context,
          controller: _ithNumberFieldController,
          hintText: "Enter ith number",
        ),
      );

  Widget _buildLagInputField() => Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: CustomFormField(
          context: context,
          controller: _lagFieldController,
          hintText: "Enter lag",
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
