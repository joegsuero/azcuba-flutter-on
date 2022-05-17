import 'package:flutter/material.dart';
//
import 'package:application/src/pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        primaryColor: Colors.green.shade900,
      )));
}
