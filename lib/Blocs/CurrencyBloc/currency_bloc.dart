import 'dart:convert';
import 'package:Currency_Converter/DataBaseProvider/HiveCurrencyDBProvider.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import '../../models/Currency.dart';
part 'currency_event.dart';
part 'currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  CurrencyBloc() : super(CurrencyInitial()) {
    on<LoadCurrencies>((event, emit) async {
      HiveCurrencyDBProvider hc = HiveCurrencyDBProvider();
      var currencyList = await hc.getSupportedCurrenciesList();
      emit(CurrencyLoaded(currencyList: currencyList));
    });
  }
}
