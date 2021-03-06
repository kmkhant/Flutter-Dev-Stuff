import 'dart:convert';

import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const bitcoinAverageURL = "";

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    String requestURL = '$bitcoinAverageURL/BTC$selectedCurrency';
    http.Response response = await http.get(requestURL);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      double lastPrice = decodedData('last');
      return lastPrice.toStringAsFixed(0);
    } else {
      print(response.statusCode);
      throw 'Problem with get request';
    }
  }
}
