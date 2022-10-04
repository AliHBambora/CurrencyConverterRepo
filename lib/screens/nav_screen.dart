import 'package:Currency_Converter/DataBaseProvider/HiveConversionHistoryProvider.dart';
import 'package:Currency_Converter/screens/converterHistory_screen.dart';
import 'package:flutter/material.dart';
import 'package:Currency_Converter/screens/convert_screen.dart';
import 'package:Currency_Converter/screens/home_screen.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  @override
  int _selectedIndex = 0;
  final _screens = [
    const HomeScreen(),
    const ConvertScreen(),
    ConverterHistoryScreen(
        dbprovider:
            HiveConversionHistoryDBProvider()) //Dependency injection of DatabaseProvider
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: _screens
              .asMap()
              .map((i, screen) => MapEntry(
                    i,
                    Offstage(
                      offstage: _selectedIndex != i,
                      child: screen,
                    ),
                  ))
              .values
              .toList()),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedFontSize: 16.0,
        unselectedFontSize: 12.0,
        backgroundColor: Colors.blueAccent,
        unselectedItemColor: Colors.white54,
        selectedItemColor: Colors.white,
        onTap: (i) {
          setState(() {
            _selectedIndex = i;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.list_outlined,
                size: 30.0,
              ),
              label: "Currencies",
              activeIcon: Icon(Icons.list_rounded, size: 30.0)),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.compare_arrows_outlined,
                size: 30.0,
              ),
              label: "Convert",
              activeIcon: Icon(Icons.compare_arrows, size: 30.0)),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.history_outlined,
              size: 30.0,
            ),
            activeIcon: Icon(Icons.history, size: 30.0),
            label: "History",
          ),
        ],
      ),
    );
  }
}
