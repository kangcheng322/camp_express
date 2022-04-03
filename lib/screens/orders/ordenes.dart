import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/productos_controller.dart';
import '../../widgets/orders/orden_item.dart';

class Orden extends StatefulWidget {
  const Orden({Key? key}) : super(key: key);

  @override
  State<Orden> createState() => _OrdenState();
}

class _OrdenState extends State<Orden> {
  @override
  Widget build(BuildContext context) {
    ProductosController productosController = Get.find();
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
          "Mis ordenes",
          style: TextStyle(
            color: Color.fromARGB(255, 78, 160, 62),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //const SizedBox(height: 10),
          Expanded(
            child: Obx(() => ListView.separated(
                  itemCount: productosController.ordenes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ordenItem(
                        productosController.ordenes.elementAt(index).total,
                        productosController.ordenes.elementAt(index).date,
                        productosController.ordenes.elementAt(index).productos,
                        productosController.ordenes.elementAt(index).cantidades,
                        productosController.ordenes.elementAt(index).precios);
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
