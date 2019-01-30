import 'package:flutter/material.dart';
import './test_list_screen.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Stat Tests",
      theme: ThemeData(
        fontFamily: "ProductSans",
        brightness: Brightness.light,
        primarySwatch: Colors.deepPurple,
        primaryColor: Colors.deepPurple,
        accentColor: Colors.purple,
        primaryIconTheme: IconThemeData(
          color: Colors.black,
        ),
        textTheme: TextTheme(
          title: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
          ),
          headline: TextStyle(
            color: Colors.black,
            fontSize: 18.0,
          ),
          subhead: TextStyle(
            color: Colors.black,
            fontSize: 14.0,
          ),
        ),
      ),
      home: TestListScreen(),
    );
  }
}
