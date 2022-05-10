import 'package:camp_express/controller/tarjeta_controller.dart';
import 'package:camp_express/screens/profile/edit/tarjetas.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/tarjeta.dart';

class AgregarTarjeta extends StatefulWidget {
  const AgregarTarjeta({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<AgregarTarjeta> {
  final numero = TextEditingController();
  final fecha = TextEditingController();
  final cvv = TextEditingController();
  final propietario = TextEditingController();

  bool _isObscure = true;

  @override
  void initState() {
    _isObscure = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Agregar nueva tarjeta",
                style: TextStyle(fontSize: 30),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Form(
                    child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: TextFormField(
                        controller: numero,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Color(0xFFF6F6F6),
                            labelText: 'Número'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: TextFormField(
                        controller: fecha,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Color(0xFFF6F6F6),
                            labelText: 'Fecha'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: TextFormField(
                        obscureText: _isObscure,
                        controller: cvv,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Color(0xFFF6F6F6),
                          labelText: 'CVV',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: TextFormField(
                        controller: propietario,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Color(0xFFF6F6F6),
                          labelText: 'Propietario',
                        ),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          TarjetaController tarjetaController = Get.find();
                          var email = FirebaseAuth.instance.currentUser!.email;
                          await tarjetaController.addCreditCard(numero.text,
                              fecha.text, cvv.text, email, propietario.text);
                          await tarjetaController.getCreditCards();
                          //Get.back();
                          Get.to(() => const Tarjetas());
                        },
                        style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 78, 160, 62),
                            fixedSize: const Size(314.0, 70.0),
                            onPrimary: const Color.fromARGB(255, 255, 255, 255),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            padding: const EdgeInsets.symmetric(vertical: 22),
                            textStyle: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700)),
                        child: const Text('Agregar nueva tarjeta')),
                  ],
                )),
              ),
            ],
          ),
        ));
  }
}
