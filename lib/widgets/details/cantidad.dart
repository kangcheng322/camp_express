import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/productos_controller.dart';

class Cantidad extends StatefulWidget {
  final String id;
  const Cantidad({Key? key, required this.id}) : super(key: key);

  @override
  _CantidadState createState() => _CantidadState();
}

class _CantidadState extends State<Cantidad> {
  ProductosController productosController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Text(
          'Cantidad: ',
          style: TextStyle(
            fontFamily: 'Raleway',
            fontWeight: FontWeight.bold,
            fontSize: 17,
            color: Color.fromARGB(255, 78, 160, 62),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 5),
        ),
        OutlinedButton(
          onPressed: () {
            /* setState(() {
              if (_n > 0) {
                _n--;
              }
            });*/
            productosController.resCantidad(widget.id);
          },
          child: const Text(
            '-',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 78, 160, 62),
            ),
          ),
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            side: const BorderSide(
              width: 2.5,
              color: Color.fromARGB(255, 78, 160, 62),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 5),
        ),
        Obx(() => Text(
              productosController.cantidadCarrito(widget.id).toString(),
              style: const TextStyle(
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Color.fromARGB(255, 78, 160, 62),
              ),
            )),
        const Padding(
          padding: EdgeInsets.only(right: 5),
        ),
        OutlinedButton(
          onPressed: () {
            /*  setState(() {
              if (_n < 50) {
                _n++;
              }
            });*/
            productosController.addCantidad(widget.id);
          },
          child: const Text(
            '+',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 78, 160, 62),
            ),
          ),
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            side: const BorderSide(
              width: 2.5,
              color: Color.fromARGB(255, 78, 160, 62),
            ),
          ),
        ),
      ],
    );
  }
}
