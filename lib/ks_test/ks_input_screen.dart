import 'package:flutter/material.dart';
import 'package:stat_tests/utils/utility.dart';
import 'package:stat_tests/utils/page_transition.dart';
import 'package:stat_tests/utils/input_validators.dart';
import 'package:stat_tests/widgets/custom_appbar.dart';
import 'package:stat_tests/widgets/custom_button.dart';
import 'package:stat_tests/widgets/custom_form_field.dart';
import 'package:stat_tests/ks_test/ks_calculator.dart';
import 'package:stat_tests/ks_test/ks_results_screen.dart';

class KSInputScreen extends StatefulWidget {
  @override
  KSInputScreenState createState() {
    return new KSInputScreenState();
  }
}

class KSInputScreenState extends State<KSInputScreen> {
  TextEditingController _numbersFieldController;
  TextEditingController _divFactorFieldController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _numbersFieldController = TextEditingController();
    _divFactorFieldController = TextEditingController();
  }

  @override
  void dispose() {
    _numbersFieldController.dispose();
    _divFactorFieldController.dispose();
    super.dispose();
  }

  KSCalculator _getCalculator() {
    // Capture the string in text fields
    String numbersStr = _numbersFieldController.text.toString();
    String divFactorStr = _divFactorFieldController.text.toString();

    // Convert the string to required types
    double divFactor = double.tryParse(divFactorStr) ?? 1.0;
    List<double> numbers = Utility.toDoubleList(numbersStr, divFactor);

    // Create a KS test calculator
    return KSCalculator(
      numbers: numbers,
      divFactor: divFactor,
    );
  }

  void _onCalculateButtonPressed() {
    // Navigate to results page
    if (_formKey.currentState.validate()) {
      Navigator.push(
        context,
       SlideUpTransition(
          widget: KSResultsScreen(
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
        title: "Kolmogorov Smirnov Test",
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
            _buildCalculateButton(),
          ],
        ),
      ),
    );
  }
}
