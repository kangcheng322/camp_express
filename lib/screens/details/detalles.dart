import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:camp_express/widgets/details/build_button.dart';
import 'package:unicons/unicons.dart';

import '../../controller/productos_controller.dart';
import '../../widgets/details/cantidad.dart';

class Detalles extends StatefulWidget {
  final String nombre;
  final double precio;
  final String cantidad;
  final double rating;
  final String image;
  final bool favorito;
  final String id;
  const Detalles({
    Key? key,
    required this.nombre,
    required this.precio,
    required this.cantidad,
    required this.rating,
    required this.image,
    required this.favorito,
    required this.id,
  }) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<Detalles> {
  ProductosController productosController = Get.find();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40.0),
        child: AppBar(
          bottomOpacity: 0.0,
          elevation: 0.0,
          shadowColor: Colors.transparent,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          leading: Padding(
            padding: EdgeInsets.only(
              left: size.width * 0.05,
              top: 10,
            ),
            child: SizedBox(
              height: size.width * 0.1,
              width: size.width * 0.1,
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Icon(
                    UniconsLine.multiply,
                    color: const Color.fromARGB(255, 78, 160, 62),
                    size: size.height * 0.03,
                  ),
                ),
              ),
            ),
          ),
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          leadingWidth: size.width * 0.15,
          centerTitle: true,
          actions: <Widget>[
            Padding(
                //padding: EdgeInsets.only(right: size.width * 0.05, top: 8),
                padding: EdgeInsets.only(right: size.width * 0.025, top: 8),
                /* child: Container(
                  height: size.width * 0.1,
                  width: size.width * 0.1,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),*/
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        UniconsLine.heart_break,
                        size: size.height * 0.03,
                        color: const Color.fromARGB(255, 78, 160, 62),
                      ),
                      onPressed: () {
                        productosController.ajustarFavorito1(widget.id);
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        UniconsLine.heart_medical,
                        size: size.height * 0.03,
                        color: const Color.fromARGB(255, 78, 160, 62),
                      ),
                      onPressed: () {
                        productosController.ajustarFavorito2(widget.id);
                      },
                    ),
                  ],
                ) //),
                ),
          ],
        ),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05,
          ),
          child: Stack(
            children: [
              ListView(
                children: [
                  Image.network(
                    widget.image,
                    height: size.height * 0.535,
                  ),
                  Row(
                    children: [
                      Text(
                        widget.cantidad,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          color: Colors.black,
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.star,
                        color: Colors.yellow[700],
                        size: size.width * 0.05,
                      ),
                      Text(
                        "${widget.rating}",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                            color: Colors.yellow[700],
                            fontSize: size.width * 0.04,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        widget.nombre,
                        textAlign: TextAlign.left,
                        style: GoogleFonts.lato(
                          color: const Color.fromARGB(255, 78, 160, 62),
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "${widget.precio}\$",
                        style: GoogleFonts.lato(
                          color: Colors.black,
                          fontSize: size.width * 0.06,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        'Producto 100% del campo colombiano, cultivado y cuidado siempre con los mejores estándares... ',
                        style: TextStyle(
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                            color: Colors.black54),
                      )),
                  Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(left: 45),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              padding: const EdgeInsets.all(0.0),
                              elevation: 0.0),
                          onPressed: () {},
                          child: const Text(
                            'Ver más ->',
                            style: TextStyle(
                                color: Color.fromARGB(255, 78, 160, 62),
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Raleway',
                                decoration: TextDecoration.underline),
                          ))),
                  Row(
                    children: [
                      Obx(() => Text(
                            productosController
                                    .obtenerSubtotal(widget.id)
                                    .toString() +
                                '\$',
                            style: GoogleFonts.lato(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      const Spacer(),
                      Cantidad(id: widget.id)
                    ],
                  )
                ],
              ),
              buildButton(size, widget.id),
            ],
          ),
        ),
      ),
    );
  }
}
