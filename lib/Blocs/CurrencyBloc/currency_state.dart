part of 'currency_bloc.dart';

abstract class CurrencyState extends Equatable {
  const CurrencyState();

  @override
  List<Object> get props => [];
}

//Initial State
class CurrencyInitial extends CurrencyState {}

//State after the list of supported currencies are loaded from the API or Hive box(database)
class CurrencyLoaded extends CurrencyState {
  final List<Currency> currencyList;

  const CurrencyLoaded({required this.currencyList});

  @override
  List<Object> get props => [currencyList];
}
