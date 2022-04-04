import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/login_controller.dart';

class Contrasena extends StatefulWidget {
  const Contrasena({Key? key}) : super(key: key);
  @override
  _ContrasenaState createState() => _ContrasenaState();
}

class _ContrasenaState extends State<Contrasena> {
  late bool _passwordVisible;
  LoginController loginController = Get.find();
  void initState() {
    _passwordVisible = false;
  }

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
                  'Contraseña',
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ),
            ],
          ),
          TextField(
            key: const Key('TextField_contrasena'),
            onChanged: (text) {
              loginController.obtenerContrsena(text);
            },
            decoration: InputDecoration(
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    // Based on passwordVisible state choose the icon
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    // Update the state i.e. toogle the state of passwordVisible variable
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
                suffixStyle: const TextStyle(color: Colors.white)),
            obscureText: !_passwordVisible,
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
