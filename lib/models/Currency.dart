// import 'dart:convert';

// import 'package:equatable/equatable.dart';

// // CurrencyListResponse userResponseFromJson(String str) =>
// //     CurrencyListResponse.fromJson(json.decode(str));

// // String userResponseToJson(CurrencyListResponse data) =>
// //     json.encode(data.toJson());

// class Currency extends Equatable {
//   Currency({
//     required this.symbol,
//     required this.name,
//   });

//   final String symbol;
//   final String name;

//   @override
//   List<Object?> get props => [name, symbol];

//   // Method for saving a list of supported currencies from the API
//   List<Currency> toCurrencyList(Map<String, dynamic> json) {
//     List<Currency> currencyList = [];
//     json.forEach((key, value) {
//       currencyList.add(Currency(symbol: key, name: value));
//     });
//     return currencyList;
//   }
// }

import 'package:hive/hive.dart';

part 'Currency.g.dart';

@HiveType(typeId: 0)
class Currency extends HiveObject {
  @HiveField(0)
  late String symbol;
  @HiveField(1)
  late String name;
}
