import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_base/model/Coin.dart';
import 'package:flutter_base/model/WatchlistModel.dart';
import 'package:flutter_base/utils/Strings.dart';
import 'package:flutter_base/utils/theme.dart';
import 'package:provider/provider.dart';

class AllCoins extends StatefulWidget {
  const AllCoins({Key key}) : super(key: key);

  @override
  _AllCoinsState createState() => _AllCoinsState();
}

class _AllCoinsState extends State<AllCoins> {
  final _watchlist = <Coin>[];
  final _coins = <Coin>[
    Coin("BTC/USD", 60000.00, 10000.00, 15),
    Coin("ETH/USD", 4000.00, 1000.00, 25),
    Coin("ADA/USD", 400.00, 100.00, 25),
    Coin("LINK/USD", 50.00, 10.00, 20),
    Coin("YFI/USD", 50000.00, 10000.00, 20),
    Coin("UNI/USD", 50000.00, 10000.00, 20),
    Coin("BAKE/USD", 50000.00, 10000.00, 20),
    Coin("CAKE/USD", 50000.00, 10000.00, 20),
    Coin("DOGE/USD", 50000.00, 10000.00, 20),
    Coin("BNB/USD", 50000.00, 10000.00, 20),
    Coin("MATIC/USD", 50000.00, 10000.00, 20),
    Coin("NEAR/USD", 50000.00, 10000.00, 20),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBlueGray8,
        appBar: AppBar(
          backgroundColor: kBlueGray7,
          title: Text(Strings.allCoins),
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            );
          }),
          actions: _watchlist.length != 0 ? [
            IconButton(
                icon: Icon(Icons.check),
                onPressed: () {
                  for (Coin coin in _watchlist) {
                    Provider.of<WatchlistModel>(context, listen: false).add(coin);
                  }
                  Navigator.pop(context);
                })
          ] : [],
        ),
        body: _buildAllCoinsList()
    );
  }

  Widget _buildAllCoinsList() {
    return Consumer<WatchlistModel>(builder: (context, list, child) {
      for (Coin coin in list.coins) {
        log("henzy coin ${coin.mName}");
      }
      return ListView.builder(
          itemCount: _coins.length,
          itemBuilder: (BuildContext _context, int i) {
            return _buildRow(_coins[i], list.coins.contains(_coins[i]));
          });
    });
  }

  Widget _buildRow(Coin coin, bool isSaved) {
    final alreadySaved = _watchlist.contains(coin);
    return ListTile(
      title: Text(
        coin.mName,
        style: TextStyle(
          color: kBlueGray0
        ),
      ),
      trailing: Icon(
        alreadySaved ? Icons.check_box : Icons.check_box_outline_blank,
        color: alreadySaved ? kAccentColor : kBlueGray0,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _watchlist.remove(coin);
          } else {
            _watchlist.add(coin);
          }
        });
      },
    );
  }
}
