class Coin {
  int mId;
  String mName;
  double mPrice;
  double mChangeValue;
  double mChangePercent;

  Coin(int id, String name, double price, double changeValue, double changePercent) {
    mId = id;
    mName = name;
    mPrice = price;
    mChangeValue = changeValue;
    mChangePercent = changePercent;
  }
}