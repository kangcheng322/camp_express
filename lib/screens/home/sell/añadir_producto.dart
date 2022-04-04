import 'dart:io';

import 'package:camp_express/screens/home/sell/venta.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnadirProducto extends StatefulWidget {
  const AnadirProducto({Key? key}) : super(key: key);

  @override
  State<AnadirProducto> createState() => _AnadirProductoState();
}

class _AnadirProductoState extends State<AnadirProducto> {
  String dropdownvalue = 'C.C.';
  String currentTextNombre = "Papas criollas";
  String currentTextDescrip = "Las mejores papas del mercado";
  String currentTextPrecio = "\$10000.0";
  String currentTextCantidad = "1500 g";
  String currentTextImage = "https://imgix.com/imagen";
  var items = [
    'C.C.',
    'C.E.',
  ];

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
          "Añadir producto",
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
              padding: EdgeInsets.all(5.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Nombre",
                  hintText: currentTextNombre,
                ),
                onChanged: (currentTextNombre) => setState(() {
                  currentTextNombre = currentTextNombre;
                }),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Descripción",
                  hintText: currentTextDescrip,
                ),
                onChanged: (currentTextDescrip) => setState(() {
                  currentTextDescrip = currentTextDescrip;
                }),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Precio",
                  hintText: currentTextPrecio,
                ),
                onChanged: (currentTextPrecio) => setState(() {
                  currentTextPrecio = currentTextPrecio;
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Cantidad",
                ),
                onChanged: (currentTextCantidad) => setState(() {
                  currentTextCantidad = currentTextCantidad;
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Imagen",
                ),
                onChanged: (currentTextImage) => setState(() {
                  currentTextImage = currentTextImage;
                }),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            ElevatedButton(
                onPressed: () {
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
