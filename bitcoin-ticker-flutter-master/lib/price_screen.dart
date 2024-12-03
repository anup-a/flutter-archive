import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coin_data.dart';
import 'networking.dart';
import 'exchange.dart';

String apiURL = 'https://rest.coinapi.io/v1/exchangerate/';
String apiKey = '9EA01451-9B44-4F04-91A9-0910C6DEF6B7';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedValue = "INR";
  Exchange exchange = Exchange(b: "", l: "", e: "");

  getExchangeValue(String value) async {
    List<String> cryptoList = [
      'BTC',
      'ETH',
      'LTC',
    ];
    List<String> rates = [];
    for (var i = 0; i < 3; i++) {
      Network network =
          Network('${apiURL}${cryptoList[i]}/${value}?apikey=${apiKey}');
      var exchangeRate = await network.getData();
      print('${apiURL}${cryptoList[i]}/${value}?apikey=${apiKey}');
      print(exchangeRate['rate']);
      rates.add(exchangeRate['rate'].toStringAsFixed(2));
    }

    setState(() {
      selectedValue = value;
      exchange.bitcoin = rates[0];
      exchange.litecoin = rates[2];
      exchange.ethereum = rates[1];
    });
    print(exchange);
  }

  @override
  void initState() {
    super.initState();
    getExchangeValue(selectedValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 BTC = ${exchange.bitcoin} ${selectedValue}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 ETH = ${exchange.ethereum} ${selectedValue}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 LTC = ${exchange.litecoin} ${selectedValue}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30.0),
              color: Colors.lightBlue,
              child: CupertinoPicker(
                backgroundColor: Colors.lightBlue,
                itemExtent: 32.0,
                onSelectedItemChanged: (index) {
                  var value = currenciesList[index];
                  getExchangeValue(value);
                },
                children: currenciesList.map((String currency) {
                  return Text(
                    currency,
                  );
                }).toList(),
              )),
        ],
      ),
    );
  }
}

// DropdownButton(
//               value: selectedValue,
//               items: currenciesList.map((String currency) {
//                 return DropdownMenuItem(
//                   child: Text(currency),
//                   value: currency,
//                 );
//               }).toList(),
//               onChanged: (value) => {
//                 getExchangeValue(value.toString()),
//               },
//             ),
