import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base/utils/Strings.dart';
import 'package:flutter_base/utils/theme.dart';
import 'package:flutter_base/view/base/home.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: kBlueGray7, // status bar color
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appName,
      home: Home(),
    );
  }
}
