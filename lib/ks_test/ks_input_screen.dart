import 'package:flutter/material.dart';
import 'package:stat_tests/widgets/custom_appbar.dart';

class KSInputScreen extends StatefulWidget {
  @override
  KSInputScreenState createState() {
    return new KSInputScreenState();
  }
}

class KSInputScreenState extends State<KSInputScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: CustomAppBar(
        context: context,
        title: "KS Test",
      ),
    );
  }
}
