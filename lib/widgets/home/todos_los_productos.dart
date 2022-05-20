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
                  itemCount: productosController.producto.length,
                  itemBuilder: (context, i) {
                    print('Hello world' +
                        productosController.producto.length.toString());
                    return construirCuadro(
                        i, size, productosController.producto);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
