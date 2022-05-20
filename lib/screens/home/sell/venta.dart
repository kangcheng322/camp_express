import 'package:camp_express/controller/agregar_producto.dart';
import 'package:camp_express/controller/auth_controller.dart';
import 'package:camp_express/controller/usuario_controller.dart';
import 'package:camp_express/screens/home/sell/a%C3%B1adir_producto.dart';
import 'package:camp_express/screens/home/sell/editar_producto.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Venta extends StatefulWidget {
  const Venta({Key? key}) : super(key: key);

  @override
  State<Venta> createState() => _VentaState();
}

class _VentaState extends State<Venta> {
  //UsuarioController usuarioController =Get.find();
  List<dynamic> postList = [];
  List<dynamic> newList = [];
  String? image2;
  AgregarProductoController agregarProductoController = Get.find();
  AuthController authController = Get.find();

  void initState() {
    super.initState();
    //Referenciar la base de datos
    DatabaseReference postsRef = FirebaseDatabase.instance.ref('Productos');
    //Escuchar y obtener los valores del Realtime Database
    postsRef.onValue.listen((DatabaseEvent event) {
      var data = event.snapshot.value;
      if (data != null) {
        Map<String, dynamic>.from(data as dynamic)
            .forEach((key, value) => postList.add(value));
      }
      //Mostrar las url de cada imagen
      newList = [];
      for (var i = 0; i < postList.length; i++) {
        if (postList[i]['email'] == authController.userEmail()) {
          setState(() => newList.add(postList[i]));
        }
      }
      postList = [];
    });
  }

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
            newList = [];
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
              newList = [];
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
              child: ListView.separated(
                padding: const EdgeInsets.all(8),
                itemCount: newList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                        iconColor: const Color.fromARGB(255, 78, 160, 62),
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
                                  child: Image.network(newList[index]['image']),
                                )),
                          ),
                        ),
                        title: Text(newList[index]['product'],
                            style: const TextStyle(
                              color: Color.fromARGB(255, 78, 160, 62),
                            )),
                        trailing: PopupMenuButton(
                            onSelected: (value) => value == 1
                                ? Get.to(() => EditarProducto(
                                      clave: newList[index]['key'],
                                    ))
                                : null,
                            itemBuilder: (context) => [
                                  const PopupMenuItem(
                                    value: 1,
                                    child: Text("Editar",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 78, 160, 62),
                                        )),
                                  ),
                                  const PopupMenuItem(
                                    value: 2,
                                    child: Text("Borrar",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 78, 160, 62),
                                        )),
                                  )
                                ])),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
