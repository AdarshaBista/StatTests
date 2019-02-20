import 'package:flutter/material.dart';
import 'package:stat_tests/utils/utility.dart';
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
    String _numbersStr = _numbersFieldController.text.toString();
    String _divFactorStr = _divFactorFieldController.text.toString();

    // Convert the string to required types
    double _divFactor = double.tryParse(_divFactorStr) ?? 1.0;
    List<double> _numbers = Utility.converStrToList(_numbersStr, _divFactor);

    // Create a chi square test calculator
    return KSCalculator(
      numbers: _numbers,
      divFactor: _divFactor,
    );
  }

  void _onCalculateButtonPressed() {
    // Navigate to results page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => KSResultsScreen(
              calculator: _getCalculator(),
            ),
      ),
    );
  }

  Widget _buildNumbersInputField() => Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: CustomFormField(
          context: context,
          controller: _numbersFieldController,
          hintText: "Enter space separated Numbers",
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
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 10.0,
        ),
        children: <Widget>[
          _buildNumbersInputField(),
          _buildDivFactorInputField(),
          _buildCalculateButton(),
        ],
      ),
    );
  }
}
