import 'package:camp_express/widgets/inicio/input.dart';
import 'package:flutter/material.dart';

import '../../widgets/inicio/input.dart';

class Resetear extends StatelessWidget {
  const Resetear({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 215, 233, 167),
      body: Column(
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 50.0, bottom: 45),
                  child:
                      const Image(image: AssetImage('assets/images/logo.png')),
                )
              ]),
          Form(
            child: Container(
              margin: const EdgeInsets.only(top: 50.0, bottom: 45),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 78, 160, 62),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              height: 380,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                  padding: EdgeInsets.fromLTRB(50.0, 36.0, 50, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          'Resetear contraseña',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Raleway',
                            fontSize: 30.0,
                            color: Colors.white,
                          ),
                        ),
                        Input(),
                        Container(
                          padding: EdgeInsets.only(top: 45),
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, "login");
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 215, 233, 167),
                                  fixedSize: Size(314.0, 70.0),
                                  onPrimary: Color.fromARGB(255, 78, 160, 62),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 22),
                                  textStyle: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700)),
                              child: Text('Resetear')),
                        ),
                        Container(
                            alignment: Alignment.center,
                            child: TextButton(
                              child: Text(
                                'Iniciar sesión',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17.0,
                                    decoration: TextDecoration.underline),
                              ),
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, "login");
                              },
                            )),
                      ],
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}