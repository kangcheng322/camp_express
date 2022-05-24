import 'package:camp_express/controller/address_controller.dart';
import 'package:camp_express/controller/auth_controller.dart';
import 'package:camp_express/controller/login_controller.dart';
import 'package:camp_express/controller/tarjeta_controller.dart';
import 'package:camp_express/screens/profile/edit/direccion_envio.dart';
import 'package:camp_express/screens/profile/edit/mapa_direcciones.dart';
import 'package:camp_express/screens/profile/noti/notificacion.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/usuario_controller.dart';
import '../orders/compras.dart';
import 'edit/editar_perfil.dart';
import 'edit/tarjetas.dart';

class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  AuthController authController = Get.find();
  List<dynamic> postList = [];
  String? image2;
  List<dynamic> dirList = [];
  String direccion = '';
  String barrio = '';
  String ciudad = '';
  void initState() {
    super.initState();
    String imagenPerfil = '';
    image2 =
        'https://firebasestorage.googleapis.com/v0/b/campexpress-36d33.appspot.com/o/Necesario%2Fusuario_anonimo.png?alt=media&token=0f77bea5-d44e-4905-9546-8a4379f027e4';
    //Referenciar la base de datos
    DatabaseReference postsRef = FirebaseDatabase.instance.ref('Perfiles');
    //Escuchar y obtener los valores del Realtime Database
    postsRef.onValue.listen((DatabaseEvent event) {
      var data = event.snapshot.value;
      if (data != null) {
        Map<String, dynamic>.from(data as dynamic)
            .forEach((key, value) => postList.add(value));
      }
      //Buscar la foto de perfil actual del usuario
      for (var i = 0; i < postList.length; i++) {
        if (postList[i]['email'] == authController.userEmail()) {
          imagenPerfil = postList[i]['image'];
        }
      }
      //Utilizo una url para cargarla como imagen

      setState(() {
        if (imagenPerfil != '') {
          image2 = imagenPerfil;
        }
      });
      postList = [];
    });
    String aux = '';
    String aux2 = '';
    String aux3 = '';
    //Referenciar la base de datos
    DatabaseReference ref = FirebaseDatabase.instance.ref('Direcciones');
    //Escuchar y obtener los valores del Realtime Database
    ref.onValue.listen((DatabaseEvent event) {
      var data2 = event.snapshot.value;
      if (data2 != null) {
        Map<String, dynamic>.from(data2 as dynamic)
            .forEach((key, value) => dirList.add(value));
      }
      //Buscar la foto de perfil actual del usuario
      for (var i = 0; i < dirList.length; i++) {
        if (dirList[i]['email'] == authController.userEmail()) {
          aux = dirList[i]['direccion'];
          aux2 = dirList[i]['barrio'];
          aux3 = dirList[i]['ciudad'];
        }
      }
      //Utilizo una url para cargarla como imagen

      setState(() {
        if (imagenPerfil != '') {
          direccion = aux;
          barrio = aux2;
          ciudad = aux3;
        }
      });
      dirList = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find();
    UsuarioController usuarioController = Get.find();
    LoginController loginController = Get.find();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          leadingWidth: size.width * 0.15,
          title: Image.asset(
            'assets/images/logo.png',
            height: size.height * 0.07,
            width: size.width * 0.35,
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            child: SingleChildScrollView(
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
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
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        child: Image.network(image2!)),
                                  ),
                                )
                              ],
                            ),
                            Text(
                              authController.userEmail(),
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 78, 160, 62)),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                const VerticalDivider(
                                  width: 36,
                                  thickness: 1,
                                  indent: 20,
                                  endIndent: 0,
                                ),
                                const Icon(Icons.location_on_outlined),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(direccion),
                                    Text(barrio),
                                    Text(ciudad),
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
                      text: 'Mis compras',
                      onClick: () {
                        Get.to(() => const Compra());
                      }),
                  PerfilOpciones(
                      text: 'Tarjetas',
                      onClick: () async {
                        TarjetaController tarjetaController = Get.find();
                        await tarjetaController.getCreditCards();
                        Get.to(() => const Tarjetas());
                      }),
                  PerfilOpciones(
                      text: 'Notificaciones',
                      onClick: () {
                        Get.to(() => const Notificacion());
                      }),
                  PerfilOpciones(
                      text: 'Ver direcciones',
                      onClick: () async {
                        AddressController addressController = Get.find();
                        await addressController.getAddresses();
                        Get.to(() => MapaDirecciones());
                      }),
                ],
              ),
            ),
          ),
        ));
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
