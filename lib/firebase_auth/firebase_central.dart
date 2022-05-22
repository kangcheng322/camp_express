import 'package:camp_express/controller/usuario_controller.dart';
import 'package:camp_express/screens/inicio/login.dart';
import 'package:camp_express/widgets/home/bottom_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirebaseCentral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const BottomNavBar();
        } else {
          return const Login();
        }
      },
    );
  }
}
