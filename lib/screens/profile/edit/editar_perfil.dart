import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:camp_express/controller/usuario_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unicons/unicons.dart';
import '../../../controller/login_controller.dart';
import 'package:intl/intl.dart';

class EditarPerfil extends StatefulWidget {
  const EditarPerfil({Key? key}) : super(key: key);

  @override
  State<EditarPerfil> createState() => _EditarPerfilState();
}

class _EditarPerfilState extends State<EditarPerfil> {
  late String dropdownvalue;
  UsuarioController usuarioController = Get.find();
  LoginController loginController = Get.find();
  final nameController = TextEditingController();
  final edadController = TextEditingController();
  final generoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // loginController.mostrarDatosUsuario();
    // dropdownvalue = loginController.dropDownValue();
    /* //Referenciar la base de datos
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
    });*/
  }

  //String dropdownvalue = 'Vacío';
  var items = [
    'Sin definir',
    'Masculino',
    'Femenino',
  ];
  bool showPassword = false;
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
            // loginController.reasignarValor();
          },
          icon: const Icon(Icons.arrow_back,
              color: Color.fromARGB(255, 78, 160, 62)),
        ),
        title: const Text(
          "Editar perfil",
          style: TextStyle(
            color: Color.fromARGB(255, 78, 160, 62),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 16, top: 60, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              const SizedBox(
                height: 15,
              ),
              Center(
                  child: Stack(
                children: [
                  Obx(() => usuarioController.image.path.isNotEmpty
                      ? Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                                width: 4,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.1),
                                  offset: const Offset(0, 10))
                            ],
                            shape: BoxShape.circle,
                          ),
                          child: ClipOval(
                            // borderRadius: BorderRadius.circular(150),
                            child: Image.file(
                              usuarioController.image,
                              //width: 230,
                              //height: 230,
                              fit: BoxFit.cover,
                            ),
                          ))
                      : Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 4,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.1),
                                  offset: const Offset(0, 10))
                            ],
                            shape: BoxShape.circle,
                          ),
                          child: ClipOval(
                            // borderRadius: BorderRadius.circular(150),
                            child: Icon(
                              Icons.people,
                              size: 60,
                              color: Colors.grey[800],
                            ),
                          ))),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: const Color.fromARGB(255, 78, 160, 62),
                          ),
                          child: PopupMenuButton(
                              position: PopupMenuPosition.under,
                              child: const Icon(
                                Icons.wifi_protected_setup,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                              onSelected: (value) => value == 1
                                  ? usuarioController.pickImage()
                                  : usuarioController.pickImageC(),
                              itemBuilder: (context) => [
                                    const PopupMenuItem(
                                      value: 1,
                                      child: Text("Escoger de la galería"),
                                    ),
                                    const PopupMenuItem(
                                      value: 2,
                                      child: Text("Tomar foto"),
                                    )
                                  ]))),
                ],
              )),
              const SizedBox(
                height: 35,
              ),

              Padding(
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Color(0xFFF6F6F6),
                      labelText: 'Name'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: TextFormField(
                  controller: edadController,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Color(0xFFF6F6F6),
                      labelText: 'Edad'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: TextFormField(
                  controller: generoController,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Color(0xFFF6F6F6),
                      labelText: 'Genero'),
                ),
              ),

              // buildTextField(
              //     "Usuario", loginController.nombreUsuario, false, 1),
              // buildTextField("Contraseña", '**********', true, 2),
              // buildTextField("Edad", loginController.edad, false, 3),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: <Widget>[
              //     const Text(
              //       'Género:    ',
              //       style: TextStyle(
              //           color: Color.fromARGB(255, 78, 160, 62), fontSize: 16),
              //     ),
              //     DropdownButton(
              //       // Valor inicial

              //       value: dropdownvalue,

              //       // Icono flecha abajo
              //       icon: const Icon(
              //         Icons.keyboard_arrow_down,
              //         color: Colors.black87,
              //       ),

              //       // Array list de items
              //       items: items.map((String items) {
              //         return DropdownMenuItem(
              //           value: items,
              //           child: Text(items),
              //         );
              //       }).toList(),
              //       // Mostrar en la primera posición el valor seleccionado
              //       onChanged: (String? newValue) {
              //         // loginController.obtenerGenero(newValue!);
              //         setState(() {
              //           // dropdownvalue = newValue;
              //         });
              //       },
              //       style: const TextStyle(color: Colors.black87, fontSize: 15),
              //       underline: Container(
              //         height: 1,
              //         color: Colors.black87,
              //       ),
              //     ),
              //   ],
              // ),
              const SizedBox(
                height: 35,
              ),
              ElevatedButton(
                  onPressed: () async {
                    // loginController.editarUsuario('', 4, true);

                    await usuarioController.updateUser(nameController.text,
                        edadController.text, generoController.text);
                    usuarioController.uploadStatusImage(nameController.text,
                        edadController.text, generoController.text);
                    usuarioController.image = File('');
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 78, 160, 62),
                      fixedSize: const Size(314.0, 70.0),
                      onPrimary: const Color.fromARGB(255, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      padding: const EdgeInsets.symmetric(vertical: 22),
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w700)),
                  child: const Text('Guardar')),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, String placeholder,
      bool isPasswordTextField, int tipo) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextFormField(
        onChanged: (text) {
          // loginController.editarUsuario(text, tipo, false);
        },
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white.withOpacity(0.7),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromARGB(255, 78, 160, 62), width: 0.0)),
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 78, 160, 62)),
          ),
          labelStyle: const TextStyle(color: Color.fromARGB(255, 78, 160, 62)),
          labelText: labelText,
          hintText: placeholder,
          hintStyle: const TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
          suffixIcon: isPasswordTextField
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  icon: const Icon(
                    Icons.remove_red_eye,
                    color: Color.fromARGB(255, 78, 160, 62),
                  ),
                )
              : null,
          /* floatingLabelStyle:
              MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
            final Color color = states.contains(MaterialState.error)
                ? Theme.of(context).errorColor
                : const Color.fromARGB(255, 78, 160, 62);
            return TextStyle(color: color, letterSpacing: 1.3);
          }),*/
        ),

        /* validator: (String? value) {
          if (value == null || value == '') {
            if (num == 1) {
              return 'Enter name';
            } else {
              if (num == 2) {
                return 'Enter contraseña';
              } else {
                return 'Enter edad';
              }
            }
          }
          return null;
        },
        autovalidateMode: AutovalidateMode.always,*/
        style: const TextStyle(color: Colors.black87),
        cursorColor: Colors.black87,
      ),
    );
  }
}
