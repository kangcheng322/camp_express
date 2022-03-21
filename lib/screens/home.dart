import 'package:camp_express/widgets/home/todos_los_productos.dart';
import 'package:camp_express/widgets/home/construir_botones_productos.dart';
import 'package:camp_express/widgets/bottom_nav_bar.dart';
import 'package:camp_express/widgets/home/populares.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0.0,
        elevation: 0.0,
        shadowColor: Colors.transparent,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        leading: Padding(
          padding: EdgeInsets.only(
            left: size.width * 0.05,
          ),
          child: SizedBox(
            height: size.width * 0.1,
            width: size.width * 0.1,
            child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      10,
                    ),
                  ),
                ),
                child: Icon(
                  UniconsLine.bars,
                  color: Color.fromARGB(255, 78, 160, 62),
                  size: size.height * 0.025,
                )),
          ),
        ),
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        leadingWidth: size.width * 0.15,
        title: Image.asset(
          'assets/images/logo.png',
          height: size.height * 0.07,
          width: size.width * 0.35,
        ),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              right: size.width * 0.05,
            ),
            child: Container(
              height: size.width * 0.1,
              width: size.width * 0.1,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Icon(
                UniconsLine.search,
                color: Color.fromARGB(255, 78, 160, 62),
                size: size.height * 0.025,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: buildBottomNavBar(0, size),
      body: Container(
        color: Color.fromARGB(255, 255, 255, 255),
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
                    'Productos',
                    style: GoogleFonts.poppins(
                      color: Color.fromARGB(255, 78, 160, 62),
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: size.width * 0.1),
                    child: Icon(
                      UniconsLine.search_alt,
                      color: Color.fromARGB(255, 78, 160, 62),
                      size: size.width * 0.06,
                    ),
                  ),
                ],
              ),
            ),
            construirBotonesProductos(size),
            populares(size),
            todoLosProductos(size),
          ],
        ),
      ),
    );
  }
}
