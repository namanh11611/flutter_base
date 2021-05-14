import 'package:flutter/material.dart';
import 'package:flutter_base/utils/Strings.dart';
import 'package:flutter_base/utils/theme.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlueGray8,
      appBar: AppBar(
        backgroundColor: kBlueGray7,
        title: Text(Strings.homeTitle),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          IconButton(
            icon: const Icon(Icons.swap_vert),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(child: Text("Header")),
            ListTile(
              title: Text("Account"),
            )
          ],
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        childAspectRatio: 2,
        mainAxisSpacing: 10,
        padding: const EdgeInsets.all(10),
        children: _buildGridTileList(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        label: Text("Add"),
        foregroundColor: kPrimaryTextColorDark,
        backgroundColor: kAccentColor,
        onPressed: () {},
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.remove_red_eye),
              label: Strings.bnbWatchlist,
              backgroundColor: kBlueGray8),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_alert), label: Strings.bnbAlert),
          BottomNavigationBarItem(
              icon: Icon(Icons.analytics_outlined),
              label: Strings.bnbAnalytics),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: Strings.bnbSettings),
        ],
        currentIndex: 0,
        selectedItemColor: kAccentColor,
      ),
    );
  }

  List<Container> _buildGridTileList() {
    return List.generate(
        30,
        (index) => Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "BTC/USD $index",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "60.000,00",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  Text(
                    "+10.000,00 (20%)",
                    style: TextStyle(color: Colors.red, fontSize: 10),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: kBlueGray7, borderRadius: BorderRadius.circular(4)),
              padding: const EdgeInsets.all(10),
            ));
  }
}
