//import 'package:ecommerce_app/screens/checkout.dart';
import 'package:camp_express/widgets/cart/carrito_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/productos_controller.dart';

// Carrito de compras
class Carrito extends StatefulWidget {
  const Carrito({Key? key}) : super(key: key);

  @override
  State<Carrito> createState() => _CarritoState();
}

class _CarritoState extends State<Carrito> {
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
            // Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back,
              color: Color.fromARGB(255, 78, 160, 62)),
        ),
        title: const Text(
          "Carrito",
          style: TextStyle(
            color: Color.fromARGB(255, 78, 160, 62),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.delete_outline,
              size: 28,
              color: Colors.red,
            ),
            onPressed: () {
              productosController.vaciarCarrito();
            },
          ),
          const SizedBox(width: 8)
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 19),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //const SizedBox(height: 10),
            Expanded(
              child: Obx(() => ListView.separated(
                    itemCount: productosController.carrito.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CartItem(
                        assetPath:
                            productosController.carrito.elementAt(index).image,
                        title:
                            productosController.carrito.elementAt(index).nombre,
                        price:
                            productosController.carrito.elementAt(index).precio,
                        id: productosController.carrito.elementAt(index).id,
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  )),
            ),
            //const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Total',
                  style: GoogleFonts.lato(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Obx(() => Text(
                      productosController.total.toString() + '\$',
                      style: GoogleFonts.lato(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    )),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 78, 160, 62),
                    fixedSize: const Size(314.0, 70.0),
                    onPrimary: const Color.fromARGB(255, 255, 255, 255),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    padding: const EdgeInsets.symmetric(vertical: 22),
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w700)),
                child: const Text('Comprar')),
            //const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
