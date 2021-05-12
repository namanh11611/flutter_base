import 'package:flutter/material.dart';
import 'package:flutter_base/utils/Strings.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.homeTitle),
      ),
      backgroundColor: Colors.grey,
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        childAspectRatio: 2,
        mainAxisSpacing: 10,
        padding: const EdgeInsets.all(10),
        children: _buildGridTileList(),
      ),
    );
  }

  List<Container> _buildGridTileList() {
    return List.generate(
        30,
        (index) => Container(
              color: Colors.amber,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "BTC/USDT $index",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "60.000,00",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14),
                  ),
                  Text(
                    "+10.000,00 (20%)",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 10),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(10),
            ));
  }
}
