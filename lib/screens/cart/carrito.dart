//import 'package:ecommerce_app/screens/checkout.dart';
import 'package:camp_express/widgets/cart/carrito_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Carrito de compras
class Carrito extends StatefulWidget {
  const Carrito({Key? key}) : super(key: key);

  @override
  State<Carrito> createState() => _CarritoState();
}

class _CarritoState extends State<Carrito> {
  @override
  Widget build(BuildContext context) {
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
              color: Color.fromARGB(255, 78, 160, 62),
            ),
            onPressed: () {
              // do something
            },
          ),
          const SizedBox(width: 8)
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //const SizedBox(height: 10),
            Expanded(
              child: ListView(children: const [
                CartItem(
                  assetPath: 'assets/images/arroz.png',
                  title: 'Arroz',
                  price: 579,
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                CartItem(
                  title: 'Sandía',
                  assetPath: 'assets/images/sandia.png',
                  price: 375,
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                CartItem(
                  title: 'Tomate',
                  assetPath: 'assets/images/tomate.png',
                  price: 375,
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                CartItem(
                  title: 'Papa',
                  assetPath: 'assets/images/papas.png',
                  price: 375,
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                CartItem(
                  title: 'Maiz',
                  assetPath: 'assets/images/maiz.png',
                  price: 375,
                ),
              ]),
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
                Text(
                  '954\$',
                  style: GoogleFonts.lato(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 78, 160, 62),
                    fixedSize: const Size(314.0, 70.0),
                    onPrimary: Colors.white,
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
