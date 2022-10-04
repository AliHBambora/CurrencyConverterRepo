import 'dart:convert';
import 'dart:io';
import 'package:Currency_Converter/API_requests/API_requests.dart';
import 'package:Currency_Converter/models/ConversionHistory.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class HiveConversionHistoryDBProvider {
  // late Box box;
  static List<ConversionHistory> ch = [];

  //Initialise a new box
  Future openBox() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    Box box = await Hive.openBox<ConversionHistory>('ConversionHistory');
    return box;
  }

  //Function to insert conversion history data into the hive box
  Future<ConversionHistory> insertData(
      String fromCurrencyName,
      String fromCurrencyCode,
      String toCurrencyName,
      String toCurrencyCode,
      double fromCurrencyAmount,
      double toCurrencyAmount,
      String date) async {
    Box box = await openBox();
    // await box.clear();
    final conversionHistory = ConversionHistory()
      ..fromCurrencyName = fromCurrencyName
      ..toCurrencyName = toCurrencyName
      ..fromCurrencyCode = fromCurrencyCode
      ..toCurrencyCode = toCurrencyCode
      ..fromCurrencyAmount = fromCurrencyAmount
      ..toCurrencyAmount = toCurrencyAmount
      ..conversionDate = DateTime.parse(date);

    box.add(conversionHistory);
    return conversionHistory;
  }

  //Function to get all the past 7 days transactions
  Future<List<ConversionHistory>> getAllConversionHistory() async {
    Box box = await openBox();
    var result = box.values.toList().cast<ConversionHistory>();
    List<ConversionHistory> finalResult = [];
    var comparableDate = DateTime.now().subtract(Duration(days: 7));
    for (var item in result) {
      //Condition to check if the conversion date is within the last 7 days
      if (item.conversionDate.isAfter(comparableDate)) {
        finalResult.add(item);
      }
    }
    return finalResult;
  }

  //Function to get the conversion result from one currency to another and entering the same information in database for getting the last 7 days transactions
  Future<ConversionHistory> getConversionData(
      String fromCurrencyName,
      String toCurrencyName,
      String fromCurrencyCode,
      String toCurrencyCode,
      double amount) async {
    //Make the API request to get conversion data
    Map<String, dynamic> jsonResult = await APIRequests().GetConversionData(
        toCurrencyCode, fromCurrencyCode, amount, http.Client());
    jsonResult["fromCurrencyName"] = fromCurrencyName;
    jsonResult["toCurrencyName"] = toCurrencyName;

    //Add the entry in the conversionHistory Hive box(Database)
    ConversionHistory ch = await insertData(
        fromCurrencyName,
        fromCurrencyCode,
        toCurrencyName,
        toCurrencyCode,
        amount,
        jsonResult["result"],
        jsonResult["date"]);
    return ch;
  }
}
