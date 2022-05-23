import 'package:camp_express/controller/agregar_producto.dart';
import 'package:camp_express/controller/auth_controller.dart';
import 'package:camp_express/screens/home/sell/a%C3%B1adir_producto.dart';
import 'package:camp_express/screens/home/sell/editar_producto.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/productos_controller.dart';
import '../../../widgets/orders/orden_item.dart';

class Vendido extends StatefulWidget {
  const Vendido({Key? key}) : super(key: key);
  @override
  State<Vendido> createState() => _VendidoState();
}

class _VendidoState extends State<Vendido> {
  //UsuarioController usuarioController =Get.find();
  List<dynamic> postList = [];
  List<dynamic> newList = [];
  List<String> keyList = [];
  List<String> newKeyList = [];
  AgregarProductoController agregarProductoController = Get.find();
  AuthController authController = Get.find();

  @override
  void initState() {
    super.initState();
    //Referenciar la base de datos
    DatabaseReference postsRef =
        FirebaseDatabase.instance.ref('ProductosVendidos');
    //Escuchar y obtener los valores del Realtime Database
    postsRef.onValue.listen((DatabaseEvent event) {
      var data = event.snapshot.value;
      if (data != null) {
        Map<String, dynamic>.from(data as dynamic).forEach((key, value) {
          keyList.add(key);
          postList.add(value);
        });
      }
      //Mostrar las url de cada imagen
      newList = [];
      newKeyList = [];
      for (var i = 0; i < postList.length; i++) {
        if (postList[i]['email'] == authController.userEmail()) {
          setState(() {
            newList.add(postList[i]);
            newKeyList.add(keyList[i]);
          });
        }
      }
      postList = [];
      keyList = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    ProductosController productosController = Get.find();
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
          "Productos vendidos",
          style: TextStyle(
            color: Color.fromARGB(255, 78, 160, 62),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //const SizedBox(height: 10),
          Expanded(
            child: ListView.separated(
              itemCount: newList.length,
              itemBuilder: (BuildContext context, int index) {
                return productoVendidoItem(
                    newList[index]['product'],
                    newList[index]['image'],
                    newList[index]['date'],
                    newList[index]['time'],
                    newList[index]['cantidadCarrito'],
                    newList[index]['price']);
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget productoVendidoItem(String nombre, String url, var fecha, var hora,
    int cantidadCarrito, var precio) {
  return ExpansionTile(
    leading: Container(
      color: Colors.transparent,
      width: 55,
      height: 55,
      child: FittedBox(
        fit: BoxFit.cover,
        child: Container(
            color: Colors.transparent,
            width: 100.0,
            height: 100.0,
            child: Center(
              child: Image.network(url),
            )),
      ),
    ),
    title: Text(
      nombre,
      style: const TextStyle(
          color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold),
    ),
    subtitle: Text(fecha + ' ' + hora,
        style: const TextStyle(
            color: Color.fromARGB(255, 78, 160, 62),
            fontSize: 15,
            fontWeight: FontWeight.bold)),
    children: <Widget>[
      ListTile(
        leading: Text(cantidadCarrito.toString(),
            style: const TextStyle(
                color: Color.fromARGB(255, 78, 160, 62),
                fontSize: 15,
                fontWeight: FontWeight.bold)),

        title: const Text('X',
            textDirection: TextDirection.rtl,
            style: TextStyle(
                color: Color.fromARGB(255, 78, 160, 62),
                fontSize: 15,
                fontWeight: FontWeight.bold)),
        trailing: Text(precio.toString(),
            style: const TextStyle(
                color: Colors.black87,
                fontSize: 15,
                fontWeight: FontWeight.bold)),

        //  title: Text(precios.join('\n')),
      ),
    ],
    collapsedIconColor: const Color.fromARGB(255, 78, 160, 62),
    iconColor: const Color.fromARGB(255, 78, 160, 62),
  );
}
