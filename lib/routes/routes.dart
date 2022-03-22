import 'package:camp_express/screens/inicio/login.dart';
import 'package:camp_express/screens/inicio/registro.dart';
import 'package:camp_express/screens/inicio/resetear.dart';
import 'package:camp_express/screens/inicio/presentacion.dart';
import 'package:camp_express/screens/home/home.dart';
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
