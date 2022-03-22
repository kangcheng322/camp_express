import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  const Input({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Icon(Icons.email_outlined,
                  size: 24.0, color: Colors.white, semanticLabel: 'Email icon'),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'Correo electrónico',
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ),
            ],
          ),
          TextField(
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
            ),
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
