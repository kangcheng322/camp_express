import 'package:camp_express/widgets/home/bottom_nav_item.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import '../../screens/favoritos/favoritos.dart';
import '../../screens/home/home.dart';
import '../../screens/cart/carrito.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Favoritos(),
    Carrito(),
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
