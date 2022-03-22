import 'package:flutter/material.dart';

class Contrasena extends StatelessWidget {
  const Contrasena({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Icon(Icons.lock_outline,
                  size: 24.0, color: Colors.white, semanticLabel: 'Lock icon'),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'Contraseña',
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ),
            ],
          ),
          const TextField(
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                suffixText: 'Ver',
                suffixStyle: TextStyle(color: Colors.white)),
            obscureText: true,
            style: TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            cursorRadius: Radius.circular(16),
            cursorWidth: 7.0,
          )
        ],
      ),
    ));
  }
}
