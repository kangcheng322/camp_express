import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';
import '../../data/productos_data.dart';
import '../../widgets/home/cuadro_productos.dart';

class Favoritos extends StatefulWidget {
  const Favoritos({Key? key}) : super(key: key);

  @override
  _FavoritosState createState() => _FavoritosState();
}

class _FavoritosState extends State<Favoritos> {
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
          ),
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
                          child: GridView.builder(
                            primary: false,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 0.68,
                              crossAxisCount: 2,
                              crossAxisSpacing: 9,
                              mainAxisSpacing: 9,
                            ),
                            itemCount: productos.length,
                            itemBuilder: (context, i) {
                              return construirCuadro(i, size);
                            },
                          ),
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
