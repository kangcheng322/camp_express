import 'package:camp_express/widgets/home/cuadro_productos.dart';
import 'package:camp_express/widgets/home/construir_categoria.dart';
import 'package:flutter/material.dart';

Column populares(Size size) {
  return Column(
    children: [
      construirCategoria('Populares', size),
      Padding(
        padding: EdgeInsets.only(
          top: size.height * 0.03,
          left: size.width * 0.03,
          right: size.width * 0.03,
        ),
        child: SizedBox(
          width: size.width,
          height: size.height * 0.33,
          child: ListView.builder(
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, i) {
              return construirCuadro(i, size);
            },
          ),
        ),
      ),
    ],
  );
}
