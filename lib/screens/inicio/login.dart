import 'package:camp_express/controller/login_controller.dart';
import 'package:camp_express/controller/usuario_controller.dart';
import 'package:camp_express/screens/inicio/registro.dart';
import 'package:camp_express/widgets/inicio/contrasena.dart';
import 'package:camp_express/widgets/inicio/input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth_controller.dart';
import '../../domain/usuario.dart';

class Login extends StatefulWidget {
  const Login({
    Key? key,
  }) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  AuthController authController = Get.find();
  UsuarioController usuarioController = Get.find();

  _login(theEmail, thePassword) async {
    print('_login $theEmail $thePassword');
    try {
      await authController.login(theEmail, thePassword);
      await usuarioController.getUserData();
    } catch (err) {
      Get.snackbar(
        "Login",
        err.toString(),
        icon: Icon(Icons.person, color: Colors.red),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  // _getuserData() async {
  //   try {
  //     await userController.getUserData();
  //     Usuario currentUser = userController.user.value;
  //     printInfo(info: currentUser.name);
  //   } catch (e) {
  //     printError(info: e.toString());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.find();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 215, 233, 167),
      body: Column(
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 50.0, bottom: 45),
                  child:
                      const Image(image: AssetImage('assets/images/logo.png')),
                )
              ]),
          Form(
            child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 78, 160, 62),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              height: MediaQuery.of(context).size.height * 0.64,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(50.0, 36.0, 50, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        const Text(
                          'Inicio de sesión',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Raleway',
                            fontSize: 30.0,
                            color: Colors.white,
                          ),
                        ),
                        //Textfield del correo
                        const Campo(),
                        //Textfield de la contraseña
                        const Contrasena(),
                        // TextButton(
                        //     onPressed: () {
                        //       Navigator.pushReplacementNamed(
                        //           context, "resetear");
                        //     },
                        //     child: const Text('Contraseña olvidada?',
                        //         style: TextStyle(
                        //             color: Colors.white,
                        //             decoration: TextDecoration.underline))),
                        ElevatedButton(
                            key: const Key('boton_iniciar_sesión'),
                            onPressed: () async {
                              // loginController.comprobar(loginController.campo,
                              //     loginController.contrasena);
                              await _login(loginController.campo,
                                  loginController.contrasena);
                              //await _getuserData();
                            },
                            style: ElevatedButton.styleFrom(
                                primary:
                                    const Color.fromARGB(255, 215, 233, 167),
                                fixedSize: const Size(314.0, 70.0),
                                onPrimary:
                                    const Color.fromARGB(255, 78, 160, 62),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 22),
                                textStyle: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700)),
                            child: const Text('Iniciar sesión')),
                        Container(
                            alignment: Alignment.center,
                            child: TextButton(
                              child: const Text(
                                'Crear cuenta',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17.0,
                                    decoration: TextDecoration.underline),
                              ),
                              onPressed: () {
                                // loginController.reiniciarMensaje();
                                // Navigator.pushReplacementNamed(
                                //     context, "registro");
                                Get.to(Registro());
                              },
                            )),
                        Container(
                          padding: const EdgeInsets.only(top: 20),
                          alignment: Alignment.centerRight,
                          child: Obx(() => Text(loginController.mensaje,
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 15.0,
                              ))),
                        )
                      ],
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
