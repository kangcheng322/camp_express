import 'package:get/get.dart';
import 'package:camp_express/data/productos_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../screens/details/detalles.dart';

Padding construirCuadro(int i, Size size) {
  return Padding(
    padding: EdgeInsets.only(
      right: size.width * 0.03,
    ),
    child: Container(
      width: size.width * 0.48,
      decoration: BoxDecoration(
          // color: Colors.grey.withOpacity(0.1),
          color: Colors.white.withOpacity(0.7),
          borderRadius: const BorderRadius.all(
            Radius.circular(17),
          ),
          border: Border.all(
            color: Color.fromARGB(255, 78, 160, 62),
          )),
      child: InkWell(
        onTap: () {
          Get.to(
            () => Detalles(
              nombre: productos[i]['nombre'],
              precio: productos[i]['precio'],
              cantidad: productos[i]['cantidad'],
              rating: productos[i]['rating'],
              image: productos[i]['image'],
            ),
          );
        },
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: size.height * 0.03,
                left: size.width * 0.03,
                bottom: size.height * 0.04,
              ),
              child: SizedBox(
                width: size.width * 0.3,
                height: size.height * 0.18,
                child: Image.asset(
                  productos[i]['image'],
                  errorBuilder: (context, error, stackTrace) {
                    return const CircularProgressIndicator.adaptive();
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: size.width * 0.027,
              ),
              child: SizedBox(
                width: size.width * 0.55,
                child: Text(
                  productos[i]['nombre'],
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.lato(
                    color: Color.fromARGB(255, 78, 160, 62),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.03,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    productos[i]['cantidad'],
                    textAlign: TextAlign.left,
                    style: GoogleFonts.lato(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${productos[i]['precio']}\$",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.lato(
                      color: Colors.black,
                      fontSize: size.height * 0.023,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
