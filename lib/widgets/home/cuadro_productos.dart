import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controller/productos_controller.dart';
import '../../domain/productos.dart';
import '../../screens/details/detalles.dart';

Padding construirCuadro(int i, Size size, List<Producto> tipo) {
  ProductosController productosController = Get.find();
  return Padding(
    padding: EdgeInsets.only(
      right: size.width * 0.03,
    ),
    child: Container(
      width: size.width * 0.48,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7),
          borderRadius: const BorderRadius.all(
            Radius.circular(17),
          ),
          border: Border.all(
            color: const Color.fromARGB(255, 78, 160, 62),
          )),
      child: InkWell(
        onTap: () {
          Get.to(
            () => Detalles(
              nombre: tipo.elementAt(i).nombre,
              precio: tipo.elementAt(i).precio,
              cantidad: tipo.elementAt(i).cantidad,
              rating: tipo.elementAt(i).rating,
              image: tipo.elementAt(i).image,
              favorito: tipo.elementAt(i).favorito,
              id: tipo.elementAt(i).id,
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
                child: Obx(() => Image.asset(
                      tipo.elementAt(i).image,
                      errorBuilder: (context, error, stackTrace) {
                        return const CircularProgressIndicator.adaptive();
                      },
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: size.width * 0.027,
              ),
              child: SizedBox(
                width: size.width * 0.55,
                child: Obx(() => Text(
                      tipo.elementAt(i).nombre,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.lato(
                        color: const Color.fromARGB(255, 78, 160, 62),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.03,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() => Text(
                        tipo.elementAt(i).cantidad,
                        textAlign: TextAlign.left,
                        style: GoogleFonts.lato(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  Obx(() => Text(
                        "${tipo.elementAt(i).precio}\$",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.lato(
                          color: Colors.black,
                          fontSize: size.height * 0.023,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
