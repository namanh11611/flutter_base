class Coin {
  late int mId;
  late String mName;
  late double mPrice;
  late double mChangeValue;
  late double mChangePercent;

  Coin(int id, String name, double price, double changeValue,
      double changePercent) {
    mId = id;
    mName = name;
    mPrice = price;
    mChangeValue = changeValue;
    mChangePercent = changePercent;
  }
}
