import 'dart:io';

import 'package:camp_express/controller/agregar_producto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditarProducto extends StatefulWidget {
  final String clave;
  const EditarProducto({
    Key? key,
    required this.clave,
  }) : super(key: key);

  @override
  State<EditarProducto> createState() => _EditarProductoState();
}

class _EditarProductoState extends State<EditarProducto> {
  AgregarProductoController agregarProductoController = Get.find();
  final nameProduct = TextEditingController();
  final descripcion = TextEditingController();
  final price = TextEditingController();
  final quantity = TextEditingController();

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
          "Editar producto",
          style: TextStyle(
            color: Color.fromARGB(255, 78, 160, 62),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 16, top: 50, right: 16),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: TextFormField(
                controller: nameProduct,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Color(0xFFF6F6F6),
                    labelText: 'Nombre del producto'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: TextFormField(
                controller: descripcion,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Color(0xFFF6F6F6),
                    labelText: 'Descripción'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: TextFormField(
                controller: price,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Color(0xFFF6F6F6),
                    labelText: 'Precio'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: TextFormField(
                controller: quantity,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Color(0xFFF6F6F6),
                    labelText: 'Cantidad'),
              ),
            ),
            Row(
              children: [
                const SizedBox(width: 8),
                Container(
                  color: Colors.transparent,
                  width: 150,
                  height: 150,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Container(
                        color: Colors.transparent,
                        width: 100.0,
                        height: 100.0,
                        child: Obx(() => Center(
                            child: agregarProductoController
                                    .image.path.isNotEmpty
                                ? Image.file(agregarProductoController.image)
                                : const Text("No image selected")))),
                  ),
                ),
                const SizedBox(width: 8),
                Column(children: [
                  MaterialButton(
                      color: Colors.blue,
                      child: const Text("Pick Image from Gallery",
                          style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.bold)),
                      onPressed: () {
                        agregarProductoController.pickImage();
                      }),
                  MaterialButton(
                      color: Colors.blue,
                      child: const Text("Pick Image from Camera",
                          style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.bold)),
                      onPressed: () {
                        agregarProductoController.pickImageC();
                      }),
                ]),
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            ElevatedButton(
                onPressed: () {
                  agregarProductoController.uploadStatusImage(nameProduct.text,
                      descripcion.text, price.text, quantity.text);
                  agregarProductoController.image = File('');
                  Get.back();
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
                child: const Text('Guardar')),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, String placeholder) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white.withOpacity(0.7),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromARGB(255, 78, 160, 62), width: 0.0)),
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 78, 160, 62)),
          ),
          labelStyle: const TextStyle(color: Color.fromARGB(255, 78, 160, 62)),
          labelText: labelText,
          hintText: placeholder,
          hintStyle: const TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelStyle:
              MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
            final Color color = states.contains(MaterialState.error)
                ? Theme.of(context).errorColor
                : const Color.fromARGB(255, 78, 160, 62);
            return TextStyle(color: color, letterSpacing: 1.3);
          }),
        ),
        style: const TextStyle(color: Colors.black87),
        cursorColor: Colors.black87,
      ),
    );
  }
}
