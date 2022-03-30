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
  const CartItem({
    Key? key,
    this.price = 0,
    this.title = 'Título del producto',
    this.assetPath = '',
    required this.id,
  }) : super(key: key);

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
            Image(
              image: AssetImage(assetPath),
              width: 80,
              height: 105,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: const Color.fromARGB(255, 78, 160, 62),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '${this.price}\$',
                  style: GoogleFonts.lato(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const CantidadCarrito()
              ],
            ),
            InkWell(
                onTap: () {
                  productosController.agregarCarrito(id);
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: size.width * 0.05,
                    ),
                    const SizedBox(height: 85),
                  ],
                )),
          ])),
    );
  }
}
