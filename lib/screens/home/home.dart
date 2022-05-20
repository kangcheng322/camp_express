import 'package:camp_express/widgets/home/menu_lateral.dart';
import 'package:camp_express/widgets/home/todos_los_productos.dart';
import 'package:camp_express/widgets/home/construir_botones_productos.dart';
import 'package:camp_express/widgets/home/populares.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';

import '../../controller/productos_controller.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ProductosController productosController = Get.find();
  List<dynamic> postList = [];

  @override
  /*void initState() {
    super.initState();

    //Referenciar la base de datos
    DatabaseReference postsRef = FirebaseDatabase.instance.ref('Productos');
    //Escuchar y obtener los valores del Realtime Database
    postsRef.onValue.listen((DatabaseEvent event) {
      //productosController.reiniciar();
      var data = event.snapshot.value;
      if (data != null) {
        Map<String, dynamic>.from(data as dynamic)
            .forEach((key, value) => postList.add(value));
      }
      for (var i = 0; i < postList.length; i++) {
        productosController.addProduct(postList[i]);
      }
      postList = [];
    });
  }*/

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 78, 160, 62),
        ),
        bottomOpacity: 0.0,
        elevation: 0.0,
        shadowColor: Colors.transparent,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        automaticallyImplyLeading: true,
        titleSpacing: 0,
        leadingWidth: size.width * 0.15,
        title: Image.asset(
          'assets/images/logo.png',
          height: size.height * 0.07,
          width: size.width * 0.35,
        ),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              right: size.width * 0.05,
            ),
            child: Container(
                height: size.width * 0.1,
                width: size.width * 0.1,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: IconButton(
                  icon: Icon(
                    UniconsLine.search,
                    color: const Color.fromARGB(255, 78, 160, 62),
                    size: size.height * 0.025,
                  ),
                  onPressed: () {
                    //
                  },
                  color: Colors.purple,
                  iconSize: 40,
                )),
          ),
        ],
      ),
      drawer: menuLateral(size),
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: size.height * 0.03,
                left: size.width * 0.05,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Productos',
                    style: GoogleFonts.poppins(
                      color: const Color.fromARGB(255, 78, 160, 62),
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: size.width * 0.1),
                    child: Icon(
                      UniconsLine.search_alt,
                      color: const Color.fromARGB(255, 78, 160, 62),
                      size: size.width * 0.06,
                    ),
                  ),
                ],
              ),
            ),
            //construirBotonesProductos(size),
            //populares(size),
            todoLosProductos(size),
          ],
        ),
      ),
    );
  }
}
