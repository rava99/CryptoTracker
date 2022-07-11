import 'package:flutter/material.dart';
import 'package:myapp/models/coin.api.dart';
import 'package:myapp/models/coin.dart';
import 'package:myapp/views/screens/addCrypto.dart';
import 'package:myapp/views/widgets/appBar.dart';
import 'package:myapp/views/widgets/coin_card.dart';
/*
import 'package:myapp/models/recipe.api.dart';
import 'package:myapp/models/recipe.dart';
import 'package:myapp/views/widgets/recipe_card.dart';*/

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Coin _ethCoin;
  Coin _enjinCoin;
  bool _isLoading = true;
  //String _coinTag = 'ethereum';
  //String _coinTag;

  @override
  void initState() {
    //Denna behöver nog tas bort vid ibsApp, använd setstate direkt?
    super.initState();
    getCoins();
    //getCoin2('enjincoin');
  }

  Future<void> getCoins() async {
    try {
      _ethCoin = await CoinApi.getCoin('ethereum');
    } catch (e) {
      'Trouble with API when calling _coin';
    }
    await Future.delayed(const Duration(milliseconds: 500), () {});
    //Delay so that the API calls  dont get overwhelmed
    try {
      _enjinCoin = await CoinApi.getCoin('enjincoin');
    } catch (e) {
      'Trouble with API when calling _coin';
    }

    setState(() {
      _isLoading = false;
    });
  }
/*
  Future<void> getCoin2(String _coinTag) async {
    try {
      _coin = await CoinApi.getCoin(_coinTag);
    } catch (e) {
      'Trouble with API when calling _coin';
    }
  }*/

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    return Scaffold(
        backgroundColor: Colors.blueGrey[50],
        appBar: appBar2(
            left: GestureDetector(
                child: IconButton(
                    icon: Icon(Icons.refresh),
                    color: Colors.white,
                    iconSize: 25,
                    onPressed: () => {})),
            title: 'Crypto Tracker',
            right: GestureDetector(
                child: IconButton(
                    icon: Icon(Icons.add_circle),
                    color: Colors.white,
                    iconSize: 25,
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddCrypto()))))),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : Column(children: [
                SizedBox(
                  height: 25,
                ),
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Column(children: [
                              CoinCard(
                                  //Ha en lista med coins
                                  //kalla på getcoin
                                  coinName: 'ETH',
                                  price: _ethCoin.price.toString(),
                                  iconUrl:
                                      'https://icons.iconarchive.com/icons/cjdowner/cryptocurrency/128/Ethereum-icon.png',
                                  coinTag: 'ethereum'),
                              CoinCard(
                                  coinName: 'ENJ',
                                  price: _enjinCoin.price.toString(),
                                  iconUrl:
                                      'https://icons.iconarchive.com/icons/cjdowner/cryptocurrency/128/Enjin-Coin-icon.png',
                                  coinTag: 'enjincoin'),
                            ]))))
              ]));
  }
}
