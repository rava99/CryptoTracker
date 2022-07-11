class Coin {
  //final String coinName;
  final double price;

  // final String iconUrl;

  Coin({this.price});

  factory Coin.fromJson(dynamic json) {
    return Coin(price: json['usd'] as double);
  }

  static Coin coinFromSnapshot(snapshot) {
    return Coin.fromJson(snapshot);
  }

  @override
  String toString() {
    return 'Coin {price: $price}';
  }
}
