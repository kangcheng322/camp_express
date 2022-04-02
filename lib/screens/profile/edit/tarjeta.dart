import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Tarjeta extends StatefulWidget {
  const Tarjeta({Key? key}) : super(key: key);

  @override
  State<Tarjeta> createState() => _TarjetaState();
}

class _TarjetaState extends State<Tarjeta> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back,
              color: Color.fromARGB(255, 78, 160, 62)),
        ),
        title: const Text(
          "Mis tarjetas",
          style: TextStyle(
            color: Color.fromARGB(255, 78, 160, 62),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Center(
        child: Text(
          'No tienes tarjetas agregadas :)',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
