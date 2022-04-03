import 'package:camp_express/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/login_controller.dart';
import 'controller/productos_controller.dart';
import 'package:flutter/services.dart';

import 'controller/tarjeta_controller.dart';

void main() {
  Get.put(LoginController());
  Get.put(ProductosController());
  Get.lazyPut(() => TarjetaController());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return GetMaterialApp(
      defaultTransition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 500),
      debugShowCheckedModeBanner: false,
      title: 'Camp Express',
      routes: getApplicationRoutes(),
    );
  }
}
