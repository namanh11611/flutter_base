import 'package:flutter/material.dart';
import 'package:flutter_base/utils/Strings.dart';
import 'package:flutter_base/utils/theme.dart';

class Alert extends StatelessWidget {
  const Alert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      Strings.bnbAlert,
      style: TextStyle(color: kBlueGray0, fontSize: 24),
    ));
  }
}
