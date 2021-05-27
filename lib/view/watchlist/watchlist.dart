import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_base/model/WatchlistModel.dart';
import 'package:flutter_base/utils/theme.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Watchlist extends StatefulWidget {
  const Watchlist({Key key}) : super(key: key);

  @override
  _WatchlistState createState() {
    loadData();
    return _WatchlistState();
  }
}

class _WatchlistState extends State<Watchlist> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      childAspectRatio: 2,
      mainAxisSpacing: 10,
      padding: const EdgeInsets.all(10),
      children: _buildGridTileList(),
    );
  }

  List<Widget> _buildGridTileList() {
    return List.generate(
        Provider.of<WatchlistModel>(context).coins.length,
        (index) =>
            Consumer<WatchlistModel>(builder: (context, watchlist, child) {
              return Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      watchlist.coins.elementAt(index).mName,
                      style: TextStyle(
                          color: kBlueGray0,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      watchlist.coins.elementAt(index).mPrice.toString(),
                      style: TextStyle(color: kBlueGray1, fontSize: 14),
                    ),
                    Text(
                      watchlist.coins.elementAt(index).mChangeValue.toString() +
                          " (" +
                          watchlist.coins
                              .elementAt(index)
                              .mChangePercent
                              .toString() +
                          ")",
                      style: TextStyle(color: Colors.red, fontSize: 10),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    color: kBlueGray7, borderRadius: BorderRadius.circular(4)),
                padding: const EdgeInsets.all(10),
              );
            })
    );
  }
}

Future<void> loadData() async {
  String dataURL = 'https://api.binance.com/api/v3/ticker/24hr';
  http.Response response = await http.get(dataURL);
  // setState(() {
  List<dynamic> lists = jsonDecode(response.body);
  // });
}
