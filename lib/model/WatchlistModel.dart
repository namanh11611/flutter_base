import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter_base/model/Coin.dart';

class WatchlistModel extends ChangeNotifier {
  final List<Coin> _coins = [];

  UnmodifiableListView<Coin> get coins => UnmodifiableListView(_coins);

  void add(Coin coin) {
    _coins.add(coin);
    notifyListeners();
  }

  void remove(Coin coinRemoved) {
    for (Coin coin in _coins) {
      if (coin.mId == coinRemoved.mId) {
        _coins.remove(coin);
        notifyListeners();
      }
    }
  }

  void removeAll() {
    _coins.clear();
    notifyListeners();
  }
}
