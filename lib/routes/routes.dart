import 'package:camp_express/screens/inicio/login.dart';
import 'package:camp_express/screens/inicio/registro.dart';
import 'package:camp_express/screens/inicio/resetear.dart';
import 'package:camp_express/screens/inicio/presentacion.dart';
import 'package:flutter/material.dart';

import '../widgets/home/bottom_nav_bar.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => const Presentacion(),
    'login': (BuildContext context) => const Login(),
    'registro': (BuildContext context) => const Registro(),
    'resetear': (BuildContext context) => const Resetear(),
    'bottom_nav_bar': (BuildContext context) => const bottomNavBar(),
  };
}
