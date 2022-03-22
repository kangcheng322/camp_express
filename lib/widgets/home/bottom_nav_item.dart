import 'package:flutter/material.dart';

BottomNavigationBarItem buildBottomNavItem(IconData icon, Size size) {
  return BottomNavigationBarItem(
    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
    icon: SizedBox(
      height: size.width * 0.12,
      width: size.width * 0.12,
      child: Container(
        decoration: const BoxDecoration(
          //color: Colors.black.withOpacity(0.05),
          borderRadius: BorderRadius.all(
            Radius.circular(
              10,
            ),
          ),
        ),
        child: Icon(icon),
      ),
    ),
    label: '',
  );
}
