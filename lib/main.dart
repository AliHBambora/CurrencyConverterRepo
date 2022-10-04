import 'package:Currency_Converter/Blocs/CurrencyBloc/currency_bloc.dart';
import 'package:Currency_Converter/models/Currency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:Currency_Converter/screens/home_screen.dart';
import 'package:Currency_Converter/screens/nav_screen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/ConversionHistory.dart';

void main() async {
  //Inititialize hive local database and register the adapter models
  await Hive.initFlutter();
  Hive.registerAdapter(CurrencyAdapter());
  Hive.registerAdapter(ConversionHistoryAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Bloc for Currency model
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => CurrencyBloc()..add(LoadCurrencies())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              selectedItemColor: Colors.black87),
          brightness: Brightness.light,
        ),
        home: const NavScreen(),
      ),
    );
  }
}
