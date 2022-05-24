import 'package:camp_express/widgets/cart/cantidad_carrito.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/productos_controller.dart';

class CartItem extends StatelessWidget {
  final double price;
  final String title;
  final String assetPath;
  final String id;
  final int cantidadCarrito;
  const CartItem(
      {Key? key,
      this.price = 0,
      this.title = 'Título del producto',
      this.assetPath = '',
      required this.id,
      required this.cantidadCarrito})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductosController productosController = Get.find();
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7),
          borderRadius: const BorderRadius.all(
            Radius.circular(17),
          ),
          border: Border.all(
            color: const Color.fromARGB(255, 78, 160, 62),
          )),
      child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20),
          child: Row(children: [
            Image.network(
              assetPath,
              width: 80,
              height: 105,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title + ' x ' + cantidadCarrito.toString(),
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: const Color.fromARGB(255, 78, 160, 62),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Subtotal: ${this.price}\$',
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 20),
            InkWell(
                onTap: () {
                  productosController.eliminarUnCarrito(id);
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: size.width * 0.1,
                    ),
                    const SizedBox(
                        //height: 10,
                        ),
                  ],
                )),
          ])),
    );
  }
}
