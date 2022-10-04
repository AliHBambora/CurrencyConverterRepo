import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  int _selectedIndex = 0;
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: (i) {
        setState(() {
          _selectedIndex = i;
        });
      },
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.list_outlined),
            label: "Currencies",
            activeIcon: Icon(Icons.list_rounded)),
        BottomNavigationBarItem(
            icon: Icon(Icons.currency_exchange), label: "Convert"),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.history,
            size: 30.0,
          ),
          activeIcon: Icon(
            Icons.history_outlined,
            size: 30.0,
          ),
          label: "History",
        ),
      ],
    );
  }
}
