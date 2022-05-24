import 'dart:io';

import 'package:camp_express/controller/auth_controller.dart';
import 'package:camp_express/domain/usuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class UsuarioController extends GetxController {
  //List<Usuario> usersList = [];
  //final user = Usuario(id: "", correo: "",name: "", edad: "", genero: "").obs;
  final _image = File('').obs;
  AuthController authController = Get.find();

  File get image {
    return _image.value;
  }

  set image(File file) {
    _image.value = file;
  }

  var user = Usuario("", "", "", "", "").obs;
  Future<void> getUserData() async {
    try {
      final _firestore = FirebaseFirestore.instance;
      String uid = FirebaseAuth.instance.currentUser!.uid;
      var sRef = _firestore
          .collection("users")
          .where('email', isEqualTo: FirebaseAuth.instance.currentUser!.email);
      //List<Request> requestList = [];

      QuerySnapshot Requests = await sRef.get();
      if (Requests.docs.isNotEmpty) {
        // for (var doc in Requests.docs) {
        //   requestList.add(Request(
        //     address: doc["address"],
        //     category: doc["category"],
        //     city: doc["city"],
        //     description: doc["description"],
        //     image64List: doc["img64"].split(','),
        //     clientName: doc["clientName"],
        //     phone: doc["phone"],
        //     title: doc["title"],
        //     time: "13:00 pm",
        //     price: doc["price"],
        //     clientAgree: doc["clientAgree"],
        //     fixerAgree: doc["fixerAgree"],
        //     status: doc["status"],
        //     requestId: doc.id,
        //   ));
        // }
        Usuario u;
        u = Usuario(
            Requests.docs[0]["id"],
            Requests.docs[0]["email"],
            Requests.docs[0]["name"],
            Requests.docs[0]["edad"],
            Requests.docs[0]["genero"]);
        user.value = u;
      } else {
        user.value = Usuario("", "", "", "", "");
      }
      return Future.value(true);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> createUser(name, edad, genero, email) async {
    try {
      final _firestore = FirebaseFirestore.instance;
      await _firestore.collection("users").add({
        "email": email,
        "name": name,
        "edad": edad,
        "genero": genero,
      });
      return Future.value(true);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> updateUser(String name, String edad, String genero) async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      final _firestore = FirebaseFirestore.instance;
      var email = FirebaseAuth.instance.currentUser!.email;
      getUserId(email).then((value) async {
        if (value != "user not found") {
          await _firestore.collection("users").doc(value).update({
            "name": name,
            "edad": edad,
            "genero": genero,
          });
        }
      });

      return Future.value(true);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<String> getUserId(email) async {
    final _firestore = FirebaseFirestore.instance;
    var sRef = _firestore.collection("users").where("email", isEqualTo: email);

    QuerySnapshot users = await sRef.get();
    if (users.docs.isNotEmpty) {
      for (var doc in users.docs) {
        return doc.id;
      }
    }
    return "user not found";
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final imageTemp = File(image.path);

      this.image = imageTemp;
      // uploadStatusImage();
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImageC() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) return;

      final imageTemp = File(image.path);

      this.image = imageTemp;
      //uploadStatusImage();
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  //Subir imagen a Storage
  void uploadStatusImage(String nombre, String edad, String genero) async {
    String url = '';
    //Referenciar storage
    final storageRef = FirebaseStorage.instance.ref().child('Perfiles_fotos');
    //Tiempo actual
    DateTime timeKey = DateTime.now();
    //Agregar imagen a la carpeta
    final UploadTask uploadTask =
        storageRef.child('$timeKey.jpg').putFile(image);
    //Obtener url
    var imageUrl = await (await uploadTask).ref.getDownloadURL();
    url = imageUrl.toString();

    saveToDatabase(url, nombre, edad, genero);
  }

  //Guardar datos del perfil de usuario en el Realtime Database
  void saveToDatabase(String url, String nombre, String edad, String genero) {
    //Tiempo actual
    var dbTimeKey = DateTime.now();
    //Formato de fecha
    var formatDate = DateFormat('MMM d, yyyy');
    //Formato del tiempo
    var formatTime = DateFormat('EEEE, hh:mm aaa');
    //Formatear en fecha y hora
    String date = formatDate.format(dbTimeKey);
    String time = formatTime.format(dbTimeKey);
    //Referenciar la base de datos
    DatabaseReference ref = FirebaseDatabase.instance.ref('Perfiles');
    //Crear el cuerpo que se va a enviar
    var data = {
      'image': url,
      'date': date,
      'time': time,
      'email': authController.userEmail(),
      'nombre': nombre,
      'edad': edad,
      'genero': genero
    };
    //Mandar los datos a la base de datos
    ref.push().set(data);
  }

  //Guardar datos de la dirección en el Realtime Database
  void saveToDatabaseDirection(String direccion, String barrio, String ciudad,
      String celular, String nombre, String documentoIdentidad) {
    //Tiempo actual
    var dbTimeKey = DateTime.now();
    //Formato de fecha
    var formatDate = DateFormat('MMM d, yyyy');
    //Formato del tiempo
    var formatTime = DateFormat('EEEE, hh:mm aaa');
    //Formatear en fecha y hora
    String date = formatDate.format(dbTimeKey);
    String time = formatTime.format(dbTimeKey);
    //Referenciar la base de datos
    DatabaseReference ref = FirebaseDatabase.instance.ref('Direcciones');
    //Crear el cuerpo que se va a enviar
    var data = {
      'direccion': direccion,
      'date': date,
      'time': time,
      'email': authController.userEmail(),
      'nombre': nombre,
      'barrio': barrio,
      'ciudad': ciudad,
      'celular': celular,
      'documentoIdentidad': documentoIdentidad
    };
    //Mandar los datos a la base de datos
    ref.push().set(data);
  }
}
