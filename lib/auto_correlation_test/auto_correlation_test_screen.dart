import 'package:flutter/material.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_form_field.dart';
import '../widgets/custom_button.dart';
import './auto_correlation_test_results.dart';

class AutoCorrelationTestScreen extends StatefulWidget {
  @override
  AutoCorrelationTestScreenState createState() {
    return new AutoCorrelationTestScreenState();
  }
}

class AutoCorrelationTestScreenState extends State<AutoCorrelationTestScreen> {
  String numbersStr = "";
  String divFactorStr = "";
  String ithNumberStr = "";
  String lagStr = "";
  TextEditingController _numbersFieldController;
  TextEditingController _divFactorFieldController;
  TextEditingController _ithNumberFieldController;
  TextEditingController _lagFieldController;

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

  void onCalculateButtonPressed() {
    numbersStr = _numbersFieldController.text.toString();
    divFactorStr = _divFactorFieldController.text.toString();
    ithNumberStr = _ithNumberFieldController.text.toString();
    lagStr = _lagFieldController.text.toString();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AutoCorrelationTestResults(
            numbersStr, divFactorStr, ithNumberStr, lagStr),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: CustomAppBar(
        context: context,
        title: "Auto Correlation Test",
      ),
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 10.0,
        ),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: CustomFormField(
              context: context,
              controller: _numbersFieldController,
              hintText: "Enter space separated Numbers",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: CustomFormField(
              context: context,
              controller: _divFactorFieldController,
              hintText: "Enter division factor",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: CustomFormField(
              context: context,
              controller: _ithNumberFieldController,
              hintText: "Enter ith number",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: CustomFormField(
              context: context,
              controller: _lagFieldController,
              hintText: "Enter lag",
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomButton(
              context: context,
              text: "Calculate",
              onPressed: onCalculateButtonPressed,
            ),
          ),
        ],
      ),
    );
  }
}
