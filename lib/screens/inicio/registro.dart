import 'package:camp_express/controller/auth_controller.dart';
import 'package:camp_express/widgets/inicio/input.dart';
import 'package:camp_express/widgets/inicio/contrasena.dart';
import 'package:camp_express/widgets/inicio/confirmar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/login_controller.dart';
import '../../controller/usuario_controller.dart';
import '../../widgets/inicio/confirmar.dart';

class Registro extends StatelessWidget {
  AuthController authController = Get.find();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final edadController = TextEditingController();
  final generoController = TextEditingController();

  bool validateData() {
    if (emailController.text == "" || emailController.text.isEmpty) {
      Get.snackbar('Error', 'Por favor ingrese su dirección',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xFF808080),
          colorText: Colors.white,
          borderRadius: 10,
          margin: EdgeInsets.all(10),
          snackStyle: SnackStyle.FLOATING,
          duration: Duration(seconds: 3));
      return false;
    }

    if (passwordController.text == "" || passwordController.text.isEmpty) {
      Get.snackbar('Error', 'Por favor ingrese su barrio',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xFF808080),
          colorText: Colors.white,
          borderRadius: 10,
          margin: EdgeInsets.all(10),
          snackStyle: SnackStyle.FLOATING,
          duration: Duration(seconds: 3));
      return false;
    }

    if (nameController.text == "" || nameController.text.isEmpty) {
      Get.snackbar('Error', 'Por favor ingrese su ciudad',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xFF808080),
          colorText: Colors.white,
          borderRadius: 10,
          margin: EdgeInsets.all(10),
          snackStyle: SnackStyle.FLOATING,
          duration: Duration(seconds: 3));
      return false;
    }

    if (edadController.text == "" || edadController.text.isEmpty) {
      Get.snackbar('Error', 'Por favor ingrese su edad',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xFF808080),
          colorText: Colors.white,
          borderRadius: 10,
          margin: EdgeInsets.all(10),
          snackStyle: SnackStyle.FLOATING,
          duration: Duration(seconds: 3));
      return false;
    }

    if (generoController.text == "" || generoController.text.isEmpty) {
      Get.snackbar('Error', 'Por favor ingrese su género',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xFF808080),
          colorText: Colors.white,
          borderRadius: 10,
          margin: EdgeInsets.all(10),
          snackStyle: SnackStyle.FLOATING,
          duration: Duration(seconds: 3));
      return false;
    }

    return true;
  }

  // _signup(theEmail, thePassword, confirmPass) async {
  //   if (thePassword == confirmPass) {
  //     try {
  //       await authController.signUp(theEmail, thePassword);

  //       Get.snackbar(
  //         "Sign Up",
  //         'OK',
  //         icon: Icon(Icons.person, color: Colors.red),
  //         snackPosition: SnackPosition.BOTTOM,
  //       );
  //     } catch (err) {
  //       Get.snackbar(
  //         "Sign Up",
  //         err.toString(),
  //         icon: Icon(Icons.person, color: Colors.red),
  //         snackPosition: SnackPosition.BOTTOM,
  //       );
  //     }
  //   } else {
  //     Get.snackbar(
  //       "Verifique la contraseña",
  //       'No coinciden',
  //       icon: Icon(Icons.person, color: Colors.red),
  //       snackPosition: SnackPosition.BOTTOM,
  //     );
  //   }
  // }

  _signup(String name, String edad, String genero, String email,
      String password) async {
    //UserController userController = Get.find();
    AuthController authController = Get.find();
    printInfo(info: edad + ' ' + name + ' ' + genero);

    try {
      await authController.signUp(email, password);
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.code,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xFF808080),
          colorText: Colors.white,
          borderRadius: 10,
          margin: EdgeInsets.all(10),
          snackStyle: SnackStyle.FLOATING,
          duration: Duration(seconds: 3));
    }
  }

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.find();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color.fromARGB(255, 215, 233, 167),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 50.0, bottom: 45),
                    child: const Image(
                        image: AssetImage('assets/images/logo.png')),
                  )
                ]),
            Form(
              child: Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 78, 160, 62),
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                height: 605,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(50.0, 36.0, 50, 0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          const Text(
                            'Registro',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Raleway',
                              fontSize: 30.0,
                              color: Colors.white,
                            ),
                          ),
                          // //Textfield del correo
                          // const Campo(),
                          // //Textfield de la contraseña
                          // const Contrasena(),
                          // //Textfield de confirmar contraseña
                          // const Confirmar(),
                          Padding(
                            padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: TextFormField(
                              controller: nameController,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Color(0xFFF6F6F6),
                                  labelText: 'Name'),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: TextFormField(
                              controller: edadController,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Color(0xFFF6F6F6),
                                  labelText: 'Edad'),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: TextFormField(
                              controller: generoController,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Color(0xFFF6F6F6),
                                  labelText: 'Genero'),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: TextFormField(
                              controller: emailController,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Color(0xFFF6F6F6),
                                  labelText: 'email'),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: TextFormField(
                              controller: passwordController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Color(0xFFF6F6F6),
                                  labelText: 'password'),
                            ),
                          ),

                          Container(
                            padding: const EdgeInsets.only(top: 45),
                            child: ElevatedButton(
                                key: const Key('boton_registro'),
                                onPressed: () async {
                                  // loginController.crearUsuario(
                                  //     loginController.campo,
                                  //     loginController.contrasena,
                                  //     loginController.confirmarContrasena);
                                  if (validateData()) {
                                    await _signup(
                                        nameController.text,
                                        edadController.text,
                                        generoController.text,
                                        emailController.text,
                                        passwordController.text);
                                    UsuarioController usuarioController =
                                        Get.find();
                                    await usuarioController.createUser(
                                        nameController.text,
                                        edadController.text,
                                        generoController.text,
                                        emailController.text);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: const Color.fromARGB(
                                        255, 215, 233, 167),
                                    fixedSize: const Size(314.0, 70.0),
                                    onPrimary:
                                        const Color.fromARGB(255, 78, 160, 62),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 22),
                                    textStyle: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700)),
                                child: const Text('Registrarme')),
                          ),
                          Container(
                              alignment: Alignment.center,
                              child: TextButton(
                                child: const Text(
                                  'Iniciar sesión',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17.0,
                                      decoration: TextDecoration.underline),
                                ),
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, "login");
                                },
                              )),
                          Container(
                            alignment: Alignment.centerRight,
                            child: Obx(() => Text(loginController.mensaje2,
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
      ),
    );
  }
}
