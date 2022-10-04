import 'dart:convert';
import 'dart:ffi';
import 'package:Currency_Converter/DataBaseProvider/HiveConversionHistoryProvider.dart';
import 'package:Currency_Converter/models/ConversionHistory.dart';
import 'package:http/http.dart' as http;
import 'package:Currency_Converter/auth/secrets.dart';

class APIRequests {
  //API request to get the list of supported currencies

  Future<Map<String, dynamic>> getSupportedCurrencies(http.Client http) async {
    Map<String, String> headersInfo = {
      // "apikey": "QVchwTmbraaaiGNAGv750eNm6QUONpFF"
      "apikey": apiKey
    };
    var url = "https://api.apilayer.com/exchangerates_data/symbols";
    final response = await http.get(Uri.parse(url), headers: headersInfo);
    var responseData = json.decode(response.body);
    return responseData;
  }

  //Function used for converting amount from one currency to another currency via API call
  Future<Map<String, dynamic>> GetConversionData(String toCurrencyCode,
      String fromCurrencyCode, double amount, http.Client http) async {
    var url =
        "https://api.apilayer.com/exchangerates_data/convert?to=${toCurrencyCode}&from=${fromCurrencyCode}&amount=${amount.toString()}";
    Map<String, String> headersInfo = {
      // "apikey": "QVchwTmbraaaiGNAGv750eNm6QUONpFF"
      "apikey": apiKey
    };
    final response = await http.get(Uri.parse(url), headers: headersInfo);
    Map<String, dynamic> jsonResult = json.decode(response.body);
    return jsonResult;
  }
}
