import 'package:flutter/material.dart';
import 'package:flutter_base/utils/Strings.dart';
import 'package:flutter_base/utils/theme.dart';

class MainDrawer extends Drawer {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: kBlueGray7,
        child: ListView(
          children: <Widget>[
            DrawerHeader(
                child: _buildMenuImage(context), padding: EdgeInsets.zero),
            _buildMenuItem(context, Icons.account_circle, Strings.menuAccount),
            _buildMenuItem(context, Icons.help, Strings.menuHelp),
            _buildMenuItem(context, Icons.group, Strings.menuAboutUs),
            _buildMenuItem(context, Icons.flight, Strings.menuOther),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuImage(BuildContext context) {
    return Image(image: AssetImage('images/crypto.jpeg'));
  }

  Widget _buildMenuItem(BuildContext context, IconData icon, String menu) {
    return ListTile(
      leading: Icon(icon, color: kBlueGray0),
      title: Text(menu, style: TextStyle(color: kBlueGray0)),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
