import 'package:camp_express/widgets/home/bottom_nav_item.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

Widget buildBottomNavBar(int currIndex, Size size) {
  return BottomNavigationBar(
    iconSize: size.width * 0.07,
    elevation: 0,
    selectedLabelStyle: const TextStyle(fontSize: 0),
    unselectedLabelStyle: const TextStyle(fontSize: 0),
    currentIndex: currIndex,
    backgroundColor: Color.fromARGB(255, 255, 255, 255),
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Color.fromARGB(255, 78, 160, 62),
    unselectedItemColor: Colors.grey,
    /* onTap: (value) {
      if (value != currIndex) {
        if (value == 1) {
          Get.off(const Home());
        }
      }
    },*/
    items: [
      buildBottomNavItem(
        UniconsLine.shop,
        size,
      ),
      buildBottomNavItem(
        UniconsLine.heart,
        size,
      ),
      buildBottomNavItem(
        UniconsLine.shopping_cart_alt,
        size,
      ),
      buildBottomNavItem(
        UniconsLine.user,
        size,
      ),
    ],
  );
}
