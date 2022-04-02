import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Orden extends StatefulWidget {
  const Orden({Key? key}) : super(key: key);

  @override
  State<Orden> createState() => _OrdenState();
}

class _OrdenState extends State<Orden> {
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
          "Mis ordenes",
          style: TextStyle(
            color: Color.fromARGB(255, 78, 160, 62),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: const <Widget>[
          ExpansionTile(
            title: Text('7831131\$'),
            subtitle: Text('Fecha cuando se seleccionó'),
            children: <Widget>[
              ListTile(
                  title: Text(
                      'Producto                                                             1*12\$')),
            ],
          ),
        ],
      ),
    );
  }
}
