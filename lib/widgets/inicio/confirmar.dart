import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/login_controller.dart';

class Confirmar extends StatefulWidget {
  const Confirmar({Key? key}) : super(key: key);
  @override
  _ConfirmarState createState() => _ConfirmarState();
}

class _ConfirmarState extends State<Confirmar> {
  LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
      child: Column(
        children: <Widget>[
          Row(
            children: const [
              Icon(Icons.lock_outline,
                  size: 24.0, color: Colors.white, semanticLabel: 'Lock icon'),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  'Confirmar contrseña',
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ),
            ],
          ),
          TextField(
            key: const Key('TextField_confirmar'),
            onChanged: (text) {
              loginController.obtenerConfirmarContrasena(text);
            },
            decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                suffixStyle: TextStyle(color: Colors.white)),
            obscureText: true,
            style: const TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            cursorRadius: const Radius.circular(16),
            cursorWidth: 7.0,
          )
        ],
      ),
    );
  }
}
