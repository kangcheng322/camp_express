import 'package:camp_express/screens/home/sell/a%C3%B1adir_producto.dart';
import 'package:camp_express/screens/home/sell/editar_producto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Venta extends StatefulWidget {
  const Venta({Key? key}) : super(key: key);

  @override
  State<Venta> createState() => _VentaState();
}

class _VentaState extends State<Venta> {
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
          "Tus productos",
          style: TextStyle(
            color: Color.fromARGB(255, 78, 160, 62),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.add,
              size: 28,
              color: Color.fromARGB(255, 78, 160, 62),
            ),
            onPressed: () {
              Get.to(() => const AnadirProducto());
            },
          ),
          const SizedBox(width: 8)
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 19),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  Card(
                    child: ListTile(
                        iconColor: Color.fromARGB(255, 78, 160, 62),
                        leading: Image.asset('assets/images/notificacion.png'),
                        title: const Text('Nombre del producto',
                            style: TextStyle(
                              color: Color.fromARGB(255, 78, 160, 62),
                            )),
                        trailing: PopupMenuButton(
                            onSelected: (value) => value == 1
                                ? Get.to(() => EditarProducto())
                                : null,
                            itemBuilder: (context) => [
                                  const PopupMenuItem(
                                    child: Text("Editar",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 78, 160, 62),
                                        )),
                                    value: 1,
                                  ),
                                  const PopupMenuItem(
                                    child: Text("Borrar",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 78, 160, 62),
                                        )),
                                    value: 2,
                                  )
                                ])),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
