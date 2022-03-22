import 'package:flutter/material.dart';
import 'package:camp_express/data/productos_data.dart';
import 'package:camp_express/widgets/home/cuadro_productos.dart';
import 'package:camp_express/widgets/home/construir_categoria.dart';

Widget todoLosProductos(Size size) {
  return Column(
    children: [
      construirCategoria('Todos los productos', size),
      Padding(
        padding: EdgeInsets.only(
          top: size.height * 0.03,
          left: size.width * 0.03,
        ),
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          primary: true,
          children: <Widget>[
            SizedBox(
              width: size.width,
              height: size.height * 1.02,
              child: GridView.builder(
                primary: false,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.68,
                  crossAxisCount: 2,
                  crossAxisSpacing: 9,
                  mainAxisSpacing: 9,
                ),
                itemCount: productos.length,
                itemBuilder: (context, i) {
                  return construirCuadro(i, size);
                },
              ),
            ),
          ],
        ),
      ),
    ],
  );
}