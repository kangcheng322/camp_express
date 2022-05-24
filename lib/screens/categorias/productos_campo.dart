import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controller/productos_controller.dart';
import '../../widgets/home/cuadro_productos.dart';

class ProductosCampo extends StatefulWidget {
  const ProductosCampo({Key? key}) : super(key: key);

  @override
  _ProductosCampoState createState() => _ProductosCampoState();
}

class _ProductosCampoState extends State<ProductosCampo> {
  ProductosController productosController = Get.find();
  @override
  void initState() {
    super.initState();
    productosController.addCampo();
  }

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
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back,
                color: Color.fromARGB(255, 78, 160, 62)),
          ),
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
                      'Campo',
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
                    child: Obx(
                      () => ListView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        primary: false,
                        children: [
                          GridView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            primary: false,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 0.68,
                              crossAxisCount: 2,
                              crossAxisSpacing: 9,
                              mainAxisSpacing: 9,
                            ),
                            itemCount: productosController.campo.length,
                            itemBuilder: (context, i) {
                              return construirCuadro(
                                  i, size, productosController.campo);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
