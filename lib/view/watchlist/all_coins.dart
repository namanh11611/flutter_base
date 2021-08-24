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
  final _coins = <Coin>[
    Coin(0, "BTC/USD", 60000.00, 10000.00, 15),
    Coin(1, "ETH/USD", 4000.00, 1000.00, 25),
    Coin(2, "ADA/USD", 400.00, 100.00, 25),
    Coin(3, "LINK/USD", 50.00, 10.00, 20),
    Coin(4, "YFI/USD", 50000.00, 10000.00, 20),
    Coin(5, "UNI/USD", 50000.00, 10000.00, 20),
    Coin(6, "BAKE/USD", 50000.00, 10000.00, 20),
    Coin(7, "CAKE/USD", 50000.00, 10000.00, 20),
    Coin(8, "DOGE/USD", 50000.00, 10000.00, 20),
    Coin(9, "BNB/USD", 50000.00, 10000.00, 20),
    Coin(10, "MATIC/USD", 50000.00, 10000.00, 20),
    Coin(11, "NEAR/USD", 50000.00, 10000.00, 20),
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
        ),
        body: _buildAllCoinsList());
  }

  Widget _buildAllCoinsList() {
    return Consumer<WatchlistModel>(builder: (context, list, child) {
      return ListView.builder(
          itemCount: _coins.length,
          itemBuilder: (BuildContext _context, int i) {
            bool isSaved = false;
            for (Coin coin in list.coins) {
              if (coin.mId == _coins[i].mId) isSaved = true;
            }
            return ListTile(
              title: Text(
                _coins[i].mName,
                style: TextStyle(color: kBlueGray0),
              ),
              trailing: Icon(
                isSaved ? Icons.check_box : Icons.check_box_outline_blank,
                color: isSaved ? kAccentColor : kBlueGray0,
              ),
              onTap: () {
                setState(() {
                  if (isSaved) {
                    list.remove(_coins[i]);
                  } else {
                    list.add(_coins[i]);
                  }
                });
              },
            );
          });
    });
  }
}
