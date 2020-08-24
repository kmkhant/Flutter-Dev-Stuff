import 'dart:convert';

import 'package:bitcoin_ticker/utilities/utilities.dart';
import 'package:flutter/material.dart';
import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'package:http/http.dart' as http;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String bitcoinValue = "?";
  String selectedCurrency = "USD";

  DropdownButton<String> getDropdownButton() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
        value: selectedCurrency,
        items: dropdownItems,
        onChanged: (value) {
          setState(() {
            selectedCurrency = value;
          });
        });
  }

  void getData() async {
    try {
      var data = await CoinData().getCoinData(selectedCurrency);
      setState(() {
        bitcoinValue = data;
      });
    } catch (e) {
      print(e);
    }
  }

  // void updateUI() async {
  //   print("$url$cryptoCurrency/$selectedCurrency");
  //   http.Response response = await http.get(
  //       "$url$cryptoCurrency/$selectedCurrency",
  //       headers: {"X-CoinAPI-Key": "90779C83-C9E7-4658-BBF2-F8E00E956D13"});

  //   if (response.statusCode == 200) {
  //     print(jsonDecode(response.body));
  //     double rate = jsonDecode(response.body)["rate"];
  //     exchangeRate = rate.toStringAsFixed(2);
  //   } else {
  //     print("Error fetching Rate");
  //     print(response.body);
  //   }
  // }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(Text(currency));
    }

    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          selectedCurrency = currenciesList[selectedIndex];
        });
      },
      children: pickerItems,
    );
  }

  List<Widget> getInfoCards() {
    List<Widget> list = [];
    for (String cryptoCurrency in cryptoList) {
      list.add(Padding(
        padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
        child: InfoCard(
          cryptoCurrency: cryptoCurrency,
          bitcoinValue: bitcoinValue,
          selectedCurrency: selectedCurrency,
        ),
      ));
    }
    list.add(Container(
      height: 150,
      alignment: Alignment.center,
      padding: EdgeInsets.only(bottom: 30),
      color: Colors.lightBlue,
      child: Platform.isIOS ? iOSPicker() : iOSPicker(),
    ));

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: getInfoCards(),
        // Container(
        //   height: 150,
        //   alignment: Alignment.center,
        //   padding: EdgeInsets.only(bottom: 30),
        //   color: Colors.lightBlue,
        //   child: Platform.isIOS ? iOSPicker() : iOSPicker(),
        // )
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  InfoCard(
      {@required this.cryptoCurrency,
      this.bitcoinValue,
      this.selectedCurrency});
  final String cryptoCurrency;
  final String bitcoinValue;
  final String selectedCurrency;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlueAccent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28),
        child: Text(
          "1 $cryptoCurrency = $bitcoinValue $selectedCurrency",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
      ),
    );
  }
}
