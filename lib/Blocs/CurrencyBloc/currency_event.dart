part of 'currency_bloc.dart';

abstract class CurrencyEvent extends Equatable {
  const CurrencyEvent();

  @override
  List<Object> get props => [];
}

//Event when the list of supported currencies get loaded from the database or API
class LoadCurrencies extends CurrencyEvent {}
