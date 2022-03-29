import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controller/productos_controller.dart';
import '../../widgets/home/cuadro_productos.dart';

class Favoritos extends StatefulWidget {
  const Favoritos({Key? key}) : super(key: key);

  @override
  _FavoritosState createState() => _FavoritosState();
}

class _FavoritosState extends State<Favoritos> {
  ProductosController productosController = Get.find();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          bottomOpacity: 0.0,
          elevation: 0.0,
          shadowColor: Colors.transparent,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          leadingWidth: size.width * 0.15,
          title: Image.asset(
            'assets/images/logo.png',
            height: size.height * 0.07,
            width: size.width * 0.35,
          ),
          centerTitle: true,
        ),
        body: Container(
          color: const Color.fromARGB(255, 255, 255, 255),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.03,
                  left: size.width * 0.05,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Favoritos',
                      style: GoogleFonts.poppins(
                        color: const Color.fromARGB(255, 78, 160, 62),
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: size.height * 0.03,
                      left: size.width * 0.03,
                    ),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      primary: true,
                      children: <Widget>[
                        SizedBox(
                          width: size.width,
                          height: size.height * 1.02,
                          child: Obx(() => GridView.builder(
                                primary: false,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 0.68,
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 9,
                                  mainAxisSpacing: 9,
                                ),
                                itemCount: productosController.favoritos.length,
                                itemBuilder: (context, i) {
                                  return construirCuadro(
                                      i, size, productosController.favoritos);
                                },
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
