import 'package:camp_express/screens/categorias/artesanias.dart';
import 'package:camp_express/screens/categorias/productos_campo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Center botonProductos(Size size, String text) {
  return Center(
    child: Padding(
      padding: EdgeInsets.only(
        left: size.width * 0.015,
        right: size.width * 0.015,
      ),
      child: SizedBox(
        width: size.width * 0.34,
        height: size.height * 0.06,
        child: OutlinedButton(
          onPressed: () {
            if (text == 'Campo') {
              Get.to(const ProductosCampo());
            } else {
              Get.to(const Artesanias());
            }
          },
          child: Text(
            text,
            style: const TextStyle(
              color: Color.fromARGB(255, 78, 160, 62),
            ),
          ),
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            backgroundColor: Colors.white.withOpacity(0.7),
            side: const BorderSide(
              width: 1.8,
              color: Color.fromARGB(255, 78, 160, 62),
            ),
          ),
        ),
      ),
    ),
  );
}
