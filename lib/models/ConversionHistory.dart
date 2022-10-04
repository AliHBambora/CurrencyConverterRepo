import 'package:hive/hive.dart';
part 'ConversionHistory.g.dart';

@HiveType(typeId: 1)
class ConversionHistory {
  @HiveField(0)
  late String fromCurrencyName;
  @HiveField(1)
  late String fromCurrencyCode;
  @HiveField(2)
  late String toCurrencyName;
  @HiveField(3)
  late String toCurrencyCode;
  @HiveField(4)
  late double fromCurrencyAmount;
  @HiveField(5)
  late double toCurrencyAmount;
  @HiveField(6)
  late DateTime conversionDate;

  // ConversionHistory(
  //     {required this.fromCurrencyName,
  //     required this.fromCurrencyCode,
  //     required this.toCurrencyName,
  //     required this.toCurrencyCode,
  //     required this.fromCurrencyAmount,
  //     required this.toCurrencyAmount,
  //     required this.conversionDate});

  // ConversionHistory.fromJson(Map<String, dynamic> json)
  //     : fromCurrencyName = json['fromCurrencyName'],
  //       fromCurrencyCode = json['fromCurrencyCode'],
  //       toCurrencyName = json['toCurrencyName'],
  //       toCurrencyCode = json['toCurrencyCode'],
  //       fromCurrencyAmount = json['fromCurrencyAmount'],
  //       toCurrencyAmount = json['toCurrencyAmount'],
  //       conversionDate = json['conversionDate'];

  // Map<String, dynamic> toJson() => {
  //       'fromCurrencyName': fromCurrencyName,
  //       'fromCurrencyCode': fromCurrencyCode,
  //       'toCurrencyName': toCurrencyName,
  //       'toCurrencyCode': toCurrencyCode,
  //       'fromCurrencyAmount': fromCurrencyAmount,
  //       'toCurrencyAmount': toCurrencyAmount,
  //       'conversionDate': conversionDate
  //     };
}
