import 'package:camp_express/controller/address_controller.dart';
import 'package:camp_express/controller/auth_controller.dart';
import 'package:camp_express/controller/login_controller.dart';
import 'package:camp_express/controller/tarjeta_controller.dart';
import 'package:camp_express/domain/usuario.dart';
import 'package:camp_express/screens/profile/edit/direccion_envio.dart';
import 'package:camp_express/screens/profile/edit/mapa_direcciones.dart';
import 'package:camp_express/screens/profile/noti/notificacion.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/usuario_controller.dart';
import '../orders/ordenes.dart';
import 'edit/editar_perfil.dart';
import 'edit/tarjetas.dart';

class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  List<dynamic> postList = [];
  String? image2;
  void initState() {
    super.initState();
    //Referenciar la base de datos
    DatabaseReference postsRef = FirebaseDatabase.instance.ref('Posts');
    //Escuchar y obtener los valores del Realtime Database
    postsRef.onValue.listen((DatabaseEvent event) {
      var data = event.snapshot.value;
      if (data != null) {
        Map<String, dynamic>.from(data as dynamic)
            .forEach((key, value) => postList.add(value));
      }
      //Mostrar las url de cada imagen
      for (var i = 0; i < postList.length; i++) {
        print(postList[i]['image']);
      }
      //Utilizo una url para cargarla como imagen
      setState(
          () => image2 = postList.isNotEmpty ? postList[0]['image'] : null);

      print(image2);
      postList = [];
    });
  }
  // Usuario usuario = Usuario("", "", "", "", "");

  // initState(){
  //   UsuarioController usuarioController = Get.find();
  //   usuarioController.getUserData()
  //   .then((value)  {
  //     setState(() {

  //     });

  //   });
  // }

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
                                      child: image2 != null
                                          ? Image.network(image2!)
                                          : const Icon(
                                              Icons.person,
                                              size: 100,
                                              color: Color.fromARGB(
                                                  255, 78, 160, 62),
                                            ),
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
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
                              // mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                const Icon(Icons.location_on_outlined),
                                const SizedBox(
                                  width: 10,
                                ),
                                GetX<UsuarioController>(
                                    builder: (usuarioController) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(usuarioController.user.value.name),
                                      Text(usuarioController.user.value.correo),
                                      Text(usuarioController.user.value.edad),
                                    ],
                                  );
                                })
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
