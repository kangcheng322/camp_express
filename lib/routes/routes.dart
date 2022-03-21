import 'package:camp_express/screens/login.dart';
import 'package:camp_express/screens/registro.dart';
import 'package:camp_express/screens/resetear.dart';
import 'package:camp_express/screens/presentacion.dart';
import 'package:camp_express/screens/home.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => Presentacion(),
    'login': (BuildContext context) => const Login(),
    'registro': (BuildContext context) => const Registro(),
    'resetear': (BuildContext context) => const Resetear(),
    'home': (BuildContext context) => const Home(),
  };
}
