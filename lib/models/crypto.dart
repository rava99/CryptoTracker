import 'package:flutter/material.dart';

class Crypto {
  final String coinName;
  final String price;
  final String iconUrl;
  final String coinTag;

  Crypto(
      {@required this.coinName,
      @required this.price,
      @required this.iconUrl,
      @required this.coinTag});

  factory Crypto.fromJson(Map<String, dynamic> json) => Crypto(
        coinName: json['coinName'],
        price: json['price'],
        iconUrl: json['iconUrl'],
        coinTag: json['coinTag'],
      );

  Map<String, dynamic> toJson() => {
        'coinName': coinName,
        ' price': price,
        'iconUrl': iconUrl,
        'coinTag': coinTag,
      };
}
