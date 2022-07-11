import 'package:flutter/material.dart';
import 'package:myapp/models/crypto.dart';
import 'package:myapp/models/crypto_data.dart';
import 'package:myapp/views/widgets/card.dart';
import 'package:myapp/views/widgets/coin_card.dart';
import 'package:myapp/views/screens/home.dart';
import 'package:myapp/views/widgets/search_widget.dart';

class AddCrypto extends StatefulWidget {
  @override
  AddCryptoState createState() => AddCryptoState();
}

class AddCryptoState extends State<AddCrypto> {
  List<Crypto> cryptos; //använd sedan json fil
  String query = '';

  @override
  void initState() {
    super.initState();

    cryptos = allCryptos;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back_ios, color: Colors.white)),
          //leadingWidth: 70,
          title: Text(
            // 'Add Crypto',
            'Find Crypto',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true),
      body: Column(
        children: <Widget>[
          buildSearch(),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: cryptos.length,
              itemBuilder: (context, index) {
                final crypto = cryptos[index];

                return buildcrypto(crypto);
              },
            ),
          )),
        ],
      ), //listview builder med sökning funnktion,
    );
  }

  /* Widget buildcrypto(Crypto crypto) => ListTile(
      
        leading: Image.network(
          crypto.iconUrl,
          fit: BoxFit.cover,
          width: 50,
          height: 50,
        ),
        title: Text(crypto.coinName,
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18)),
        //ubtitle: Text(crypto.price),
      );*/
  Widget buildcrypto(Crypto crypto) => CoinCard(
      coinName: crypto.coinName,
      price: '',
      iconUrl: crypto.iconUrl,
      coinTag: '');

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Crypto coin name',
        onChanged: searchCrypto,
      );

  void searchCrypto(String query) {
    final cryptos = allCryptos.where((crypto) {
      final nameLower = crypto.coinName.toLowerCase();
      final searchLower = query.toLowerCase();

      return nameLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.cryptos = cryptos;
    });
  }
}
