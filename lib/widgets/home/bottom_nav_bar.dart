import 'package:camp_express/widgets/home/bottom_nav_item.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import '../../screens/favoritos/favoritos.dart';
import '../../screens/home/home.dart';

// ignore: camel_case_types
class bottomNavBar extends StatefulWidget {
  const bottomNavBar({Key? key}) : super(key: key);

  @override
  State<bottomNavBar> createState() => _bottomNavBarState();
}

// ignore: camel_case_types
class _bottomNavBarState extends State<bottomNavBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Favoritos(),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: size.width * 0.07,
        elevation: 0,
        selectedLabelStyle: const TextStyle(fontSize: 0),
        unselectedLabelStyle: const TextStyle(fontSize: 0),
        selectedItemColor: const Color.fromARGB(255, 78, 160, 62),
        unselectedItemColor: Colors.grey,
        items: [
          buildBottomNavItem(UniconsLine.shop, size),
          buildBottomNavItem(UniconsLine.heart, size),
          buildBottomNavItem(UniconsLine.shopping_cart_alt, size),
          buildBottomNavItem(UniconsLine.user, size),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
