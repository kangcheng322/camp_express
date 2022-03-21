import 'package:camp_express/data/productos_data.dart';
import 'package:camp_express/widgets/home/boton_productos.dart';
import 'package:flutter/material.dart';

Widget construirBotonesProductos(Size size) {
  return SizedBox(
    height: size.height * 0.08,
    child: ListView.builder(
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
          productos[i - 2]['rango'],
        );
      },
    ),
  );
}
