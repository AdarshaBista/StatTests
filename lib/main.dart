import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:stat_tests/test_list_screen.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(StatTestsApp());
  });
}

class StatTestsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Stat Tests",
      theme: ThemeData(
        fontFamily: "ProductSans",
        brightness: Brightness.light,
        primaryColor: Colors.deepPurple,
        accentColor: Colors.teal,
        primaryIconTheme: IconThemeData(
          color: Colors.black,
        ),
        textTheme: TextTheme(
          title: TextStyle(
            color: Colors.black,
            fontSize: 22.0,
          ),
          headline: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
          ),
          subhead: TextStyle(
            color: Colors.black,
            fontSize: 18.0,
          ),
        ),
      ),
      home: TestListScreen(),
    );
  }
}
