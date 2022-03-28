import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/login_controller.dart';

class Campo extends StatefulWidget {
  const Campo({Key? key}) : super(key: key);
  @override
  _CampoState createState() => _CampoState();
}

class _CampoState extends State<Campo> {
  LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
      child: Column(
        children: <Widget>[
          Row(
            children: const [
              Icon(Icons.email_outlined,
                  size: 24.0, color: Colors.white, semanticLabel: 'Email icon'),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  'Correo electrónico',
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ),
            ],
          ),
          TextField(
            onChanged: (text) {
              loginController.obtenerCampo(text);
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
            ),
            style: const TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            cursorRadius: const Radius.circular(16),
            cursorWidth: 7.0,
          ),
        ],
      ),
    );
  }
}
