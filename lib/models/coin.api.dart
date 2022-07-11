import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

import 'coin.dart';

class CoinApi {
  static Future<Coin> getCoin(String coinTag) async {
    final client = RetryClient(http.Client(), retries: 10, when: (response) {
      return response.statusCode == 429 ? true : false;
    }); //Modify delay: for optizing time of relaod
    //Or just skip retryclient and put up only try catch

    var _test;
    var httpSucceded = false;

    try {
      var uri = Uri.https('coingecko.p.rapidapi.com', '/coins/' + coinTag);
      //print('hej');
      final response = await client.get(uri, headers: {
        "x-rapidapi-host": "coingecko.p.rapidapi.com",
        "x-rapidapi-key": "6ea886f1ebmsh2cd5b819ad7e5bdp10608cjsn6fef3473e242",
        "useQueryString": "true"
      });

      print(response.statusCode);
      Map data = jsonDecode(response.body);
      //print(data);

      _test = data['market_data']['current_price'];
      print(_test);
      httpSucceded = (response.statusCode == 200);
    } catch (e) {
      'Trouble with API inside getCoin()';
    }

    return Coin.coinFromSnapshot(_test);
  }
}

//Göra on tap på plus och även en ladda knapp. Ladda knappen ska göra reload till true och sen direkt false.
//gör också så bilden på eth hämtas från coin gecko.
//Göra lista med alla coins när plus trycks. 

/*class CoinApi {
  static Future<Coin> getCoin() async {
    var _test;
    var httpSucceded = false;
    try {
      var uri = Uri.https('coingecko.p.rapidapi.com', '/coins/ethereum');
      //print('hej');
      var response = await http.get(uri, headers: {
        "x-rapidapi-host": "coingecko.p.rapidapi.com",
        "x-rapidapi-key": "6ea886f1ebmsh2cd5b819ad7e5bdp10608cjsn6fef3473e242",
        "useQueryString": "true"
      });
      print(response.statusCode);
      Map data = jsonDecode(response.body);
      print(data);

      _test = data['market_data']['current_price'];
      httpSucceded = (response.statusCode == 200);
    } catch (e) {
      if (httpSucceded == false) {
        retryFuture(getCoin(), 2000);
      }
    }
    return Coin.coinFromSnapshot(_test);
  }
}

Future<Coin> retryFuture(future, delay) {
  Future.delayed(Duration(milliseconds: delay), () {
    future();
  });
}*/