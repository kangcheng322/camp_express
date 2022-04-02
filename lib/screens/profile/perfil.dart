import 'package:camp_express/screens/profile/edit/direccion_envio.dart';
import 'package:camp_express/screens/profile/edit/tarjeta.dart';
import 'package:camp_express/screens/profile/noti/notificacion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../orders/ordenes.dart';
import 'edit/editar_perfil.dart';

class Perfil extends StatelessWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            //Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 78, 160, 62),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // const SizedBox(height: 20),
            const Text(
              'Mi perfil',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 34,
                  color: Color.fromARGB(255, 78, 160, 62)),
            ),
            const SizedBox(height: 40),
            Card(
              color: const Color.fromARGB(255, 215, 233, 167),
              elevation: 10,
              margin: const EdgeInsets.only(bottom: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(height: 12),
                      Stack(
                        clipBehavior: Clip.none,
                        alignment: AlignmentDirectional.topCenter,
                        fit: StackFit.loose,
                        children: <Widget>[
                          Container(
                            height: 60,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 215, 233, 167),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20))),
                          ),
                          Positioned(
                            top: -60,
                            child: CircleAvatar(
                              radius: 50.0,
                              backgroundColor: Colors.transparent,
                              child: ClipRRect(
                                child: Image.asset('assets/images/avatar.png'),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                            ),
                          )
                        ],
                      ),
                      const Text(
                        'Lucía Pérez',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 78, 160, 62)),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          const Icon(Icons.location_on_outlined),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              Text('Dirección: Cra 23b # 60 - 15'),
                              Text('Barrio: Los Andes'),
                              Text('Barranquilla, Colombia'),
                            ],
                          )
                        ],
                      )
                    ]),
              ),
            ),
            PerfilOpciones(
                text: 'Editar perfil',
                onClick: () {
                  Get.to(() => const EditarPerfil());
                }),
            PerfilOpciones(
                text: 'Dirección de envío',
                onClick: () {
                  Get.to(() => const Direccion());
                }),
            PerfilOpciones(
                text: 'Ordenes',
                onClick: () {
                  Get.to(() => const Orden());
                }),
            PerfilOpciones(
                text: 'Tarjetas',
                onClick: () {
                  Get.to(() => const Tarjeta());
                }),
            PerfilOpciones(
                text: 'Notificaciones',
                onClick: () {
                  Get.to(() => const Notificacion());
                }),
          ],
        ),
      ),
    );
  }
}

class PerfilOpciones extends StatelessWidget {
  final VoidCallback? onClick;
  final String text;
  const PerfilOpciones({
    Key? key,
    this.onClick,
    this.text = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: ListTile(
        // contentPadding: EdgeInsets.all(10),
        title: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        onTap: onClick,
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        tileColor: const Color.fromARGB(255, 78, 160, 62),
      ),
    );
  }
}
