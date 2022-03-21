import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Row construirCategoria(String text, size) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: EdgeInsets.only(
          left: size.width * 0.05,
          top: size.height * 0.02,
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: Color.fromARGB(255, 78, 160, 62),
            fontWeight: FontWeight.bold,
            fontSize: size.width * 0.055,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(
          right: size.width * 0.05,
        ),
        child: Text(
          'Ver todo',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: Color.fromARGB(255, 78, 160, 62),
            fontSize: size.width * 0.04,
          ),
        ),
      ),
    ],
  );
}
