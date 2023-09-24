import 'package:chitfundmate/CreateChitPage.dart';
import 'package:chitfundmate/HomePage.dart';
import 'package:chitfundmate/JoinChitPage.dart';
import 'package:chitfundmate/JoinedChitPage.dart';
import 'package:chitfundmate/LoginPage.dart';
import 'package:flutter/material.dart';

import 'CreateChitPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}
