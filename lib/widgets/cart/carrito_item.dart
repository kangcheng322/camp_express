import 'package:camp_express/widgets/cart/cantidad_carrito.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartItem extends StatelessWidget {
  final double price;
  final String title;
  final String assetPath;
  const CartItem({
    Key? key,
    this.price = 0,
    this.title = 'Título del producto',
    this.assetPath = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          padding: EdgeInsets.all(20),
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
                /* Row(
                    children: [
                      const Text('Quantity'),
                      ElevatedButton(
                        style: style,
                        onPressed: () {},
                        child: const Text('-'),
                      ),
                      const Text(
                        '1',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      ElevatedButton(
                        style: style,
                        onPressed: () {},
                        child: const Text('+'),
                      ),
                    ],
                  )*/
                const CantidadCarrito()
              ],
            )
          ])),
    );
  }
}
