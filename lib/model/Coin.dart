class Coin {
  String mName;
  double mPrice;
  double mChangeValue;
  double mChangePercent;

  Coin(String name, double price, double changeValue, double changePercent) {
    mName = name;
    mPrice = price;
    mChangeValue = changeValue;
    mChangePercent = changePercent;
  }
}