import 'package:flutter/material.dart';

class Resetear extends StatefulWidget {
  const Resetear({Key? key}) : super(key: key);
  @override
  _ResetearState createState() => _ResetearState();
}

class _ResetearState extends State<Resetear> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 215, 233, 167),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 50.0, bottom: 45),
                    child: const Image(
                        image: AssetImage('assets/images/logo.png')),
                  )
                ]),
            Form(
              child: Container(
                margin: const EdgeInsets.only(top: 50.0, bottom: 45),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 78, 160, 62),
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                height: 380,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(50.0, 36.0, 50, 0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          const Text(
                            'Resetear contraseña',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Raleway',
                              fontSize: 30.0,
                              color: Colors.white,
                            ),
                          ),
                          //Campo de texto del correo
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: const [
                                    Icon(Icons.email_outlined,
                                        size: 24.0,
                                        color: Colors.white,
                                        semanticLabel: 'Email icon'),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10.0),
                                      child: Text(
                                        'Correo electrónico',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.0),
                                      ),
                                    ),
                                  ],
                                ),
                                const TextField(
                                  //  controller: _inputController,
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    border: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                  ),
                                  style: TextStyle(color: Colors.white),
                                  cursorColor: Colors.white,
                                  cursorRadius: Radius.circular(16),
                                  cursorWidth: 7.0,
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 45),
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, "login");
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: const Color.fromARGB(
                                        255, 215, 233, 167),
                                    fixedSize: const Size(314.0, 70.0),
                                    onPrimary:
                                        const Color.fromARGB(255, 78, 160, 62),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 22),
                                    textStyle: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700)),
                                child: const Text('Resetear')),
                          ),
                          Container(
                              alignment: Alignment.center,
                              child: TextButton(
                                child: const Text(
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
      ),
    );
  }
}
