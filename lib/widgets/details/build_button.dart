import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/productos_controller.dart';

Padding buildButton(Size size, String id) {
  ProductosController productosController = Get.find();
  return Padding(
    padding: EdgeInsets.only(
      top: size.height * 0.8,
      right: size.width * 0.03,
      left: size.width * 0.08,
    ),
    child: SizedBox(
      height: size.height * 0.08,
      width: size.width * 0.75,
      child: InkWell(
        onTap: () {
          productosController.agregarCarrito(id);
        },
        child: Obx(() => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  15,
                ),
                color: productosController.estadoCarrito(id)
                    ? Colors.red
                    : const Color.fromARGB(255, 78, 160, 62),
                //color: const Color.fromARGB(255, 78, 160, 62),
              ),
              child: Align(
                child: Text(
                  productosController.estadoCarrito(id)
                      ? 'Quitar del carrito'
                      : 'Agregar al carrito',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            )),
      ),
    ),
  );
}
