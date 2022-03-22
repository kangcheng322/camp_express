import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Padding buildButton(Size size) {
  return Padding(
    padding: EdgeInsets.only(
      top: size.height * 0.8,
      right: size.width * 0.03,
      left: size.width * 0.08,
    ),
    child: SizedBox(
      height: size.height * 0.08,
      width: size.width * 0.75,
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              15,
            ),
            color: Color.fromARGB(255, 78, 160, 62),
          ),
          child: Align(
            child: Text(
              'Agregar al carrito',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: size.width * 0.04,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
