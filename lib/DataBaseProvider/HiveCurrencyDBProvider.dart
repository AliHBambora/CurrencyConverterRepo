import 'dart:convert';
import 'dart:io';
import 'package:Currency_Converter/API_requests/API_requests.dart';
import 'package:Currency_Converter/models/Currency.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class HiveCurrencyDBProvider {
  //Initialise a new box
  Future openBox() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    Box box = await Hive.openBox<Currency>('Currency');
    return box;
  }

  //Insert the list of supported currencies in the database
  Future insertData(data) async {
    Box box = await openBox();
    await box.clear();
    for (var item in data) {
      box.add(item);
    }
  }

  Future getSupportedCurrenciesList() async {
    Box box = await openBox();
    var result = box.values.toList();
    if (result.isEmpty) {
      Map<String, dynamic> result =
          await APIRequests().getSupportedCurrencies(http.Client());
      Map<String, dynamic> mp = result["symbols"];
      List<Currency> currencyList = [];
      mp.forEach((key, value) {
        final currency = Currency()
          ..symbol = key
          ..name = value;
        currencyList.add(currency);
      });

      //Insert the data retrieved from API to the hive box
      await insertData(currencyList);

      var rslt = box.values.toList();
      return rslt;
    } else {
      var rslt = box.values.toList();
      return rslt;
    }
  }
}
