import 'package:flutter/material.dart';
import 'package:myapp/views/screens/home.dart';
import 'package:myapp/views/widgets/card.dart';

class CoinCard extends StatelessWidget {
  final String coinName;
  final String price;
  final String iconUrl;
  final String coinTag;

  CoinCard(
      {@required this.coinName,
      @required this.price,
      @required this.iconUrl,
      @required this.coinTag});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(bottom: 20),
        child: card(
            child2: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Image.network(
            '$iconUrl',
            width: 50,
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  coinName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  price + ' usd',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
          ),
        ])));
  }
}
