import 'package:flutter/material.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_form_field.dart';
import '../widgets/custom_button.dart';
import './gap_test_results.dart';

class GapTestScreen extends StatefulWidget {
  @override
  GapTestScreenState createState() {
    return new GapTestScreenState();
  }
}

class GapTestScreenState extends State<GapTestScreen> {
  String numbersStr = "";
  String symbolNumStr = "";
  TextEditingController _numbersFieldController;
  TextEditingController _symbolsNumFieldController;

  @override
  void initState() {
    super.initState();
    _numbersFieldController = TextEditingController();
    _symbolsNumFieldController = TextEditingController();
  }

  @override
  void dispose() {
    _numbersFieldController.dispose();
    _symbolsNumFieldController.dispose();
    super.dispose();
  }

  void onCalculateButtonPressed() {
    numbersStr = _numbersFieldController.text.toString();
    symbolNumStr = _symbolsNumFieldController.text.toString();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GapTestResults(numbersStr, symbolNumStr),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: CustomAppBar(
        context: context,
        title: "Gap Test",
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
              controller: _symbolsNumFieldController,
              hintText: "Enter largest number",
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
