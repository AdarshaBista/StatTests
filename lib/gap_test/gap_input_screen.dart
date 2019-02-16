import 'package:flutter/material.dart';
import 'package:stat_tests/utils/utility.dart';
import 'package:stat_tests/widgets/custom_appbar.dart';
import 'package:stat_tests/widgets/custom_form_field.dart';
import 'package:stat_tests/widgets/custom_button.dart';
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

  @override
  void initState() {
    super.initState();
    _numbersFieldController = TextEditingController();
    _symbolsNumFieldController = TextEditingController();
    _divFactorFieldController = TextEditingController();
  }

  @override
  void dispose() {
    _numbersFieldController.dispose();
    _symbolsNumFieldController.dispose();
    _divFactorFieldController.dispose();
    super.dispose();
  }

  GapCalculator _getCalculator() {
    // Capture the string in text fields
    String _numbersStr = _numbersFieldController.text.toString();
    String _divFactorStr = _divFactorFieldController.text.toString();
    String _symbolNumStr = _symbolsNumFieldController.text.toString();

    // Convert the string to required types
    double _divFactor = double.tryParse(_divFactorStr) ?? 1.0;
    int _symbolNum = int.tryParse(_symbolNumStr) ?? 10;
    List<double> _numbers = Utility.converStrToList(_numbersStr);

    // Create a auto correlation test calculator based on the
    return GapCalculator(
      numbers: _numbers,
      divFactor: _divFactor,
      symbolNum: _symbolNum,
    );
  }

  void onCalculateButtonPressed() {
    // Navigate to results page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GapResultsScreen(
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

  Widget _buildSymbolNumInputField() => Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: CustomFormField(
          context: context,
          controller: _symbolsNumFieldController,
          hintText: "Enter largest number",
        ),
      );

  Widget _buildCalculateButton() => Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomButton(
          context: context,
          text: "Calculate",
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
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 10.0,
        ),
        children: <Widget>[
          _buildNumbersInputField(),
          _buildDivFactorInputField(),
          _buildSymbolNumInputField(),
          _buildCalculateButton(),
        ],
      ),
    );
  }
}
