import 'package:camp_express/controller/address_controller.dart';
import 'package:camp_express/controller/agregar_producto.dart';
import 'package:camp_express/controller/auth_controller.dart';
import 'package:camp_express/firebase_auth/firebase_central.dart';
import 'package:camp_express/routes/routes.dart';
import 'package:camp_express/screens/inicio/login.dart';
import 'package:camp_express/screens/inicio/presentacion.dart';
import 'package:camp_express/screens/inicio/registro.dart';
import 'package:camp_express/screens/inicio/resetear.dart';
import 'package:camp_express/widgets/home/bottom_nav_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/login_controller.dart';
import 'controller/productos_controller.dart';
import 'package:flutter/services.dart';

import 'controller/tarjeta_controller.dart';
import 'controller/usuario_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(LoginController());
  Get.put(AuthController());
  Get.put(ProductosController());
  Get.lazyPut(() => TarjetaController());
  Get.put(TarjetaController());

  //Get.put(UserController());
  Get.put(UsuarioController());
  Get.put(AddressController());

  Get.put(AgregarProductoController());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
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
        routes: {
          '/presentation': (BuildContext context) => const Presentacion(),
          '/login': (context) => const Login(),
          '/registro': (context) => Registro(),
          'resetear': (BuildContext context) => const Resetear(),
          'bottom_nav_bar': (BuildContext context) => const BottomNavBar(),
        },
        home: SafeArea(
          child: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: null,
              body: FutureBuilder(
                future: _initialization,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    print("error ${snapshot.error}");
                    return Wrong();
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    return const Presentacion();
                  }
                  return Loading();
                },
              )),
        ));
  }
}

class Wrong extends StatelessWidget {
  //const Wrong({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Something went wrong")),
    );
  }
}

class Loading extends StatelessWidget {
  //const Loading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Loading")),
    );
  }
}
