import 'package:flutter/material.dart';
import 'package:flutter_base/utils/Strings.dart';
import 'package:flutter_base/utils/theme.dart';

class Settings extends StatelessWidget {
  const Settings({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      Strings.bnbSettings,
      style: TextStyle(color: kBlueGray0, fontSize: 24),
    ));
  }
}
