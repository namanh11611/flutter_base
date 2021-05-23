import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base/utils/Strings.dart';
import 'package:flutter_base/utils/theme.dart';
import 'package:flutter_base/view/base/home.dart';
import 'package:flutter_base/view/watchlist/all_coins.dart';

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
      initialRoute: Strings.routeRoot,
      routes: {
        Strings.routeRoot: (context) => Home(),
        Strings.routeAllCoins: (context) => AllCoins()
      },
    );
  }
}
