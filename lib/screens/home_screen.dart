import 'dart:convert';

import 'package:Currency_Converter/Blocs/CurrencyBloc/currency_bloc.dart';
import 'package:flutter/material.dart';
import 'package:Currency_Converter/models/Currency.dart';
import 'package:Currency_Converter/widgets/supportedCountries_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    Hive.box('Currency').close();
    super.dispose();
  }

  @override
  int _selectedIndex = 0;
  List<Currency> currencyList = [];
  List<Currency> displayedCurrencyList = [];
  bool isDatabaseCreated = false;

  _HomeScreenState();
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("List of supported currencies"),
        ),
        body: BlocBuilder<CurrencyBloc, CurrencyState>(
          builder: (context, state) {
            if (state is CurrencyInitial) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.blueAccent),
              );
            }
            if (state is CurrencyLoaded) {
              return ListView(
                  children: state.currencyList.map((currency) {
                return SupportedCountriesCard(currency: currency);
              }).toList());
            } else {
              return const Text("Something went wrong");
            }
          },
        ));
  }
}
