import 'package:flutter/material.dart';
import 'package:camp_express/widgets/home/cuadro_productos.dart';
import 'package:camp_express/widgets/home/construir_categoria.dart';
import 'package:get/get.dart';

import '../../controller/productos_controller.dart';

Widget todoLosProductos(Size size) {
  ProductosController productosController = Get.find();
  return Column(
    children: [
      construirCategoria('Todos los productos', size),
      Padding(
        padding: EdgeInsets.only(
          top: size.height * 0.03,
          left: size.width * 0.03,
        ),
        child: Obx(
          () => ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            primary: false,
            children: [
              GridView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                primary: false,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.68,
                  crossAxisCount: 2,
                  crossAxisSpacing: 9,
                  mainAxisSpacing: 9,
                ),
                itemCount: productosController.producto.length,
                itemBuilder: (context, i) {
                  return construirCuadro(i, size, productosController.producto);
                },
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
