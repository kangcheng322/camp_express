import 'package:camp_express/widgets/home/boton_productos.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/productos_controller.dart';

Widget construirBotonesProductos(Size size) {
  ProductosController productosController = Get.find();
  return SizedBox(
      height: size.height * 0.08,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          botonProductos(
            size,
            'Campo',
          ),
          botonProductos(
            size,
            'Artesanías',
          ),
        ],
      )

      /* child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, i) {
        if (i == 0) {
          return botonProductos(
            size,
            'Campo',
          );
        }
        if (i == 1) {
          return botonProductos(
            size,
            'Artesanías',
          );
        }
        return botonProductos(
          size,
          productosController.producto.elementAt(i - 2).rango,
        );
      },
    ),*/
      );
}
