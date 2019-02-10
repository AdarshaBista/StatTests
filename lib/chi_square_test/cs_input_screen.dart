import 'package:flutter/material.dart';
import 'package:stat_tests/widgets/custom_appbar.dart';

class CSInputScreen extends StatefulWidget {
  @override
  CSInputScreenState createState() {
    return new CSInputScreenState();
  }
}

class CSInputScreenState extends State<CSInputScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: CustomAppBar(
        context: context,
        title: "Chi Square Test",
      ),
    );
  }
}
