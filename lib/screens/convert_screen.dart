import 'dart:ffi';

import 'package:Currency_Converter/API_requests/API_requests.dart';
import 'package:Currency_Converter/Blocs/CurrencyBloc/currency_bloc.dart';
import 'package:Currency_Converter/DataBaseProvider/HiveConversionHistoryProvider.dart';
import 'package:Currency_Converter/models/ConversionHistory.dart';
import 'package:Currency_Converter/widgets/num_pad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class ConvertScreen extends StatefulWidget {
  const ConvertScreen({Key? key}) : super(key: key);

  @override
  State<ConvertScreen> createState() => _ConvertScreenState();
}

class _ConvertScreenState extends State<ConvertScreen> {
  final fromCurrencyAmountController = TextEditingController();
  final toCurrencyAmountController = TextEditingController();
  bool _showResult = false;
  bool _loadResult = false;

  Map<String, String> fromCurrencyState = {
    "CurrencyName": "US Dollar",
    "CurrencyCode": "USD"
  }; //State for holding the from currency values
  Map<String, String> toCurrencyState = {
    "CurrencyName": "Indian Rupee",
    "CurrencyCode": "INR"
  }; //State for holding the to currency values

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Convert"),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(screenWidth * 0.05,
                    screenHeight * 0.05, screenWidth * 0.05, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Card(
                      elevation: 50,
                      color: Colors.white,
                      child: Container(
                        width: screenWidth * 0.35,
                        height: screenHeight * 0.18,
                        child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return BlocBuilder<CurrencyBloc,
                                      CurrencyState>(
                                    builder: (context, state) {
                                      if (state is CurrencyInitial) {
                                        return Center(
                                            child: CircularProgressIndicator(
                                                color: Colors.blueAccent));
                                      }
                                      if (state is CurrencyLoaded) {
                                        return ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                          child: Container(
                                            height: screenHeight * 0.70,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.0)),
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: screenHeight * 0.05,
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                      border: Border(
                                                          bottom: BorderSide(
                                                              color: Colors
                                                                  .black87,
                                                              width: 1.0))),
                                                  child: Center(
                                                      child: const Text(
                                                    "Choose a currency type",
                                                    style: TextStyle(
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                                ),
                                                Expanded(
                                                  child: ListView.builder(
                                                      itemCount: state
                                                          .currencyList.length,
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              int index) {
                                                        return GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              fromCurrencyState =
                                                                  {
                                                                "CurrencyCode": state
                                                                    .currencyList[
                                                                        index]
                                                                    .symbol,
                                                                "CurrencyName": state
                                                                    .currencyList[
                                                                        index]
                                                                    .name
                                                              };
                                                              Navigator.pop(
                                                                  context);
                                                            });
                                                          },
                                                          child: ListTile(
                                                              leading:
                                                                  CircleAvatar(
                                                                backgroundImage:
                                                                    NetworkImage(
                                                                        "https://flagcdn.com/w40/${state.currencyList[index].symbol.substring(0, state.currencyList[index].symbol.length - 1).toLowerCase()}.png"),
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                              ),
                                                              title: Column(
                                                                children: [
                                                                  Text(
                                                                      "${state.currencyList[index].symbol}"),
                                                                  Text(state
                                                                      .currencyList[
                                                                          index]
                                                                      .name)
                                                                ],
                                                              )),
                                                        );
                                                      }),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      } else {
                                        return Center(
                                            child: const Text(
                                                "Something went wrong"));
                                      }
                                    },
                                  );
                                });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        "https://flagcdn.com/w40/${fromCurrencyState["CurrencyCode"]!.substring(0, fromCurrencyState["CurrencyCode"]!.length - 1).toLowerCase()}.png"),
                                    backgroundColor: Colors.transparent,
                                  ),
                                  const SizedBox(width: 10.0),
                                  Text(fromCurrencyState["CurrencyCode"]!)
                                ],
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              TextField(
                                controller: fromCurrencyAmountController,
                                keyboardType: TextInputType.none,
                                style: const TextStyle(
                                    fontSize: 16,
                                    height: 0,
                                    fontWeight: FontWeight.bold),
                                maxLines: 1,
                                autocorrect: false,
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 0),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2,
                                            color: Colors.blueAccent)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2,
                                            color: Colors.blueAccent)),
                                    errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2, color: Colors.redAccent)),
                                    enabled: true),
                                onTap: () {
                                  showModalBottomSheet<void>(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return NumPad(
                                            delete: () {
                                              fromCurrencyAmountController
                                                      .text =
                                                  fromCurrencyAmountController
                                                      .text
                                                      .substring(
                                                          0,
                                                          fromCurrencyAmountController
                                                                  .text.length -
                                                              1)
                                                      .toLowerCase();
                                            },
                                            onSubmit: () {
                                              Navigator.pop(context);
                                            },
                                            controller:
                                                fromCurrencyAmountController);
                                      });
                                },
                              )
                            ]),
                          ),
                        ),
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios,
                        size: 50, color: Colors.black54),
                    Card(
                      elevation: 50,
                      color: Colors.white,
                      child: Container(
                        width: screenWidth * 0.35,
                        height: screenHeight * 0.18,
                        child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: GestureDetector(
                              onTap: () {
                                showModalBottomSheet<void>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return BlocBuilder<CurrencyBloc,
                                          CurrencyState>(
                                        builder: (context, state) {
                                          if (state is CurrencyInitial) {
                                            return Center(
                                                child:
                                                    CircularProgressIndicator(
                                                        color:
                                                            Colors.blueAccent));
                                          }
                                          if (state is CurrencyLoaded) {
                                            return Container(
                                              height: screenHeight * 0.60,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0)),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: screenHeight * 0.05,
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                        border: Border(
                                                            bottom: BorderSide(
                                                                color: Colors
                                                                    .black87,
                                                                width: 1.0))),
                                                    child: Center(
                                                        child: const Text(
                                                      "Choose a currency type",
                                                      style: TextStyle(
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                  ),
                                                  Expanded(
                                                    child: ListView.builder(
                                                        itemCount: state
                                                            .currencyList
                                                            .length,
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index) {
                                                          return GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                toCurrencyState =
                                                                    {
                                                                  "CurrencyCode": state
                                                                      .currencyList[
                                                                          index]
                                                                      .symbol,
                                                                  "CurrencyName": state
                                                                      .currencyList[
                                                                          index]
                                                                      .name
                                                                };
                                                              });
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: ListTile(
                                                                leading:
                                                                    CircleAvatar(
                                                                  backgroundImage:
                                                                      NetworkImage(
                                                                          "https://flagcdn.com/w40/${state.currencyList[index].symbol.substring(0, state.currencyList[index].symbol.length - 1).toLowerCase()}.png"),
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                ),
                                                                title: Column(
                                                                  children: [
                                                                    Text(
                                                                        "${state.currencyList[index].symbol}"),
                                                                    Text(state
                                                                        .currencyList[
                                                                            index]
                                                                        .name)
                                                                  ],
                                                                )),
                                                          );
                                                        }),
                                                  ),
                                                ],
                                              ),
                                            );
                                          } else {
                                            return Center(
                                                child: const Text(
                                                    "Something went wrong"));
                                          }
                                        },
                                      );
                                    });
                              },
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(
                                          "https://flagcdn.com/w40/${toCurrencyState["CurrencyCode"]!.substring(0, toCurrencyState["CurrencyCode"]!.length - 1).toLowerCase()}.png",
                                        ),
                                        backgroundColor: Colors.transparent,
                                      ),
                                      const SizedBox(width: 10.0),
                                      Text(toCurrencyState["CurrencyCode"]!)
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  TextField(
                                      controller: toCurrencyAmountController,
                                      keyboardType: TextInputType.none,
                                      enabled: false,
                                      style: const TextStyle(
                                          fontSize: 16, height: 0),
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      autocorrect: false,
                                      showCursor: false,
                                      decoration: InputDecoration(
                                          contentPadding:
                                              EdgeInsets.symmetric(vertical: 0),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.blueAccent)),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.blueAccent)),
                                          enabled: true),
                                      onTap: () {
                                        showModalBottomSheet<void>(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return NumPad(
                                                  delete: () {
                                                    toCurrencyAmountController
                                                            .text =
                                                        toCurrencyAmountController
                                                            .text
                                                            .substring(
                                                                0,
                                                                toCurrencyAmountController
                                                                        .text
                                                                        .length -
                                                                    1)
                                                            .toLowerCase();
                                                  },
                                                  onSubmit: () {
                                                    Navigator.pop(context);
                                                  },
                                                  controller:
                                                      toCurrencyAmountController);
                                            });
                                      }
                                      // decoration: InputDecoration(),
                                      )
                                ],
                              ),
                            )),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: screenHeight * 0.05),
                  child: Center(
                      child: ElevatedButton(
                    onPressed: () async {
                      if (fromCurrencyAmountController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              const Text('Please enter the currency amount'),
                          action: SnackBarAction(
                              label: 'Close',
                              textColor: Colors.white54,
                              onPressed: ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar),
                          backgroundColor: Colors.redAccent,
                        ));
                      } else {
                        setState(() {
                          _loadResult = true;
                        });
                        ConversionHistory ch =
                            await HiveConversionHistoryDBProvider()
                                .getConversionData(
                          fromCurrencyState["CurrencyName"]!,
                          toCurrencyState["CurrencyName"]!,
                          fromCurrencyState["CurrencyCode"]!,
                          toCurrencyState["CurrencyCode"]!,
                          double.parse(fromCurrencyAmountController.text),
                        );
                        setState(() {
                          toCurrencyAmountController.text =
                              ch.toCurrencyAmount.toString();
                          _showResult = true;
                          _loadResult = false;
                        });
                      }
                    },
                    child: Text("Convert"),
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(20.0),
                        textStyle: TextStyle(fontSize: 18.0)),
                  ))),
              Visibility(
                child: Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: Center(
                      child: const CircularProgressIndicator(
                          backgroundColor: Colors.blueAccent)),
                ),
                visible: _loadResult,
              ),
              Visibility(
                child: Container(
                    margin: EdgeInsets.fromLTRB(screenWidth * 0.05,
                        screenHeight * 0.05, screenWidth * 0.05, 0),
                    width: double.infinity,
                    height: screenHeight * 0.20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.greenAccent),
                    child: Center(
                      child: Text(
                        "${fromCurrencyAmountController.text} ${fromCurrencyState["CurrencyCode"]} = ${toCurrencyAmountController.text} ${toCurrencyState["CurrencyCode"]}",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    )),
                visible: _showResult,
              )
            ],
          ),
        ));
  }
}
