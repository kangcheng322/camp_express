import 'package:flutter/material.dart';

class Cantidad extends StatefulWidget {
  @override
  _CantidadState createState() => _CantidadState();
}

int _n = 0;

class _CantidadState extends State<Cantidad> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Text(
          'Cantidad: ',
          style: TextStyle(
            fontFamily: 'Raleway',
            fontWeight: FontWeight.bold,
            fontSize: 17,
            color: Color.fromARGB(255, 78, 160, 62),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5),
        ),
        OutlinedButton(
          onPressed: () {
            setState(() {
              if (_n > 0) {
                _n--;
              }
            });
          },
          child: const Text(
            '-',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 78, 160, 62),
            ),
          ),
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            side: BorderSide(
              width: 2.5,
              color: Color.fromARGB(255, 78, 160, 62),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5),
        ),
        Text(
          '$_n',
          style: TextStyle(
            fontFamily: 'Raleway',
            fontWeight: FontWeight.bold,
            fontSize: 17,
            color: Color.fromARGB(255, 78, 160, 62),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5),
        ),
        OutlinedButton(
          onPressed: () {
            setState(() {
              if (_n < 50) {
                _n++;
              }
            });
          },
          child: const Text(
            '+',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 78, 160, 62),
            ),
          ),
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            side: BorderSide(
              width: 2.5,
              color: Color.fromARGB(255, 78, 160, 62),
            ),
          ),
        ),
      ],
    );
  }
}
