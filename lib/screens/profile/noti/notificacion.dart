import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Notificacion extends StatefulWidget {
  const Notificacion({Key? key}) : super(key: key);

  @override
  State<Notificacion> createState() => _NotificacionState();
}

class _NotificacionState extends State<Notificacion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back,
              color: Color.fromARGB(255, 78, 160, 62)),
        ),
        title: const Text(
          "Notificaciones",
          style: TextStyle(
            color: Color.fromARGB(255, 78, 160, 62),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.more_vert,
              size: 28,
              color: Color.fromARGB(255, 78, 160, 62),
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 8)
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 19),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  Card(
                    elevation: 10,
                    child: ListTile(
                      leading: Image.asset('assets/images/notificacion.png'),
                      title: const Text('¡BIENVENIDO!',
                          style: TextStyle(
                              color: Color.fromARGB(255, 78, 160, 62),
                              fontWeight: FontWeight.bold)),
                      subtitle: const Text(
                          'Gracias por darnos una oportunidad, no te decepcionaremos :)',
                          style: TextStyle(color: Colors.black)),
                      trailing: const Icon(
                        Icons.more_vert,
                        color: Color.fromARGB(255, 78, 160, 62),
                      ),
                      isThreeLine: true,
                      tileColor: Colors.white.withOpacity(0.7),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
