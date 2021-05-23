import 'package:flutter/material.dart';
import 'package:flutter_base/utils/Constants.dart';
import 'package:flutter_base/utils/Strings.dart';
import 'package:flutter_base/utils/theme.dart';
import 'package:flutter_base/view/alert/alert.dart';
import 'package:flutter_base/view/analytics/analytics.dart';
import 'package:flutter_base/view/base/drawer.dart';
import 'package:flutter_base/view/settings/settings.dart';
import 'package:flutter_base/view/watchlist/watchlist.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const List<Widget> _widgetOptions = [
    Watchlist(),
    Alert(),
    Analytics(),
    Settings(),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlueGray8,
      appBar: AppBar(
        backgroundColor: kBlueGray7,
        brightness: Brightness.dark,
        title: _buildAppBarTitle(),
        actions: _buildAppBarActions(),
      ),
      drawer: MainDrawer(),
      body: _widgetOptions.elementAt(_selectedIndex),
      floatingActionButton: _buildFloatingActionButton(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          _buildBottomNavigationBarItem(
              Icons.remove_red_eye, Strings.bnbWatchlist),
          _buildBottomNavigationBarItem(Icons.add_alert, Strings.bnbAlert),
          _buildBottomNavigationBarItem(Icons.analytics, Strings.bnbAnalytics),
          _buildBottomNavigationBarItem(Icons.settings, Strings.bnbSettings)
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: kAccentColor,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildAppBarTitle() {
    String title = Strings.homeTitle;
    switch (_selectedIndex) {
      case Constants.NAV_WATCHLIST:
        title = Strings.bnbWatchlist;
        break;
      case Constants.NAV_ALERT:
        title = Strings.bnbAlert;
        break;
      case Constants.NAV_ANALYTICS:
        title = Strings.bnbAnalytics;
        break;
      case Constants.NAV_SETTINGS:
        title = Strings.bnbSettings;
        break;
    }
    return Text(title);
  }

  List<Widget> _buildAppBarActions() {
    return _selectedIndex == Constants.NAV_WATCHLIST
        ? <Widget>[
            IconSearch(),
            IconSort(),
          ]
        : null;
  }

  Widget _buildFloatingActionButton() {
    return _selectedIndex == Constants.NAV_WATCHLIST
        ? FloatingActionButton.extended(
            icon: const Icon(Icons.add),
            label: Text(Strings.btnAddPair),
            foregroundColor: kPrimaryTextColorDark,
            backgroundColor: kAccentColor,
            onPressed: () {
              Navigator.pushNamed(context, Strings.routeAllCoins);
            },
          )
        : null;
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      IconData icon, String label) {
    return BottomNavigationBarItem(
        icon: Icon(icon), label: label, backgroundColor: kBlueGray8);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class IconSearch extends StatelessWidget {
  const IconSearch({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.search),
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
    );
  }
}

class IconSort extends StatelessWidget {
  const IconSort({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.swap_vert),
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
    );
  }
}

