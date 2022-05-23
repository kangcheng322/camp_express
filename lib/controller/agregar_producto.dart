import 'dart:io';
import 'package:camp_express/controller/auth_controller.dart';
import 'package:camp_express/controller/productos_controller.dart';
import 'package:camp_express/screens/cart/carrito.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../domain/productos.dart';

class AgregarProductoController extends GetxController {
  final _image = File('').obs;
  final _imageUpdate = File('').obs;
  AuthController authController = Get.find();
  ProductosController productosController = Get.find();
  File get image {
    return _image.value;
  }

  File get imageUpdate {
    return _imageUpdate.value;
  }

  set image(File file) {
    _image.value = file;
  }

  set imageUpdate(File file) {
    _imageUpdate.value = file;
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
  void uploadStatusImage(String nameProduct, String descripcion, String price,
      String quantity) async {
    String url = '';
    //Referenciar storage
    final storageRef = FirebaseStorage.instance.ref().child('Productos');
    //Tiempo actual
    DateTime timeKey = DateTime.now();
    //Agregar imagen a la carpeta
    final UploadTask uploadTask =
        storageRef.child('$timeKey.jpg').putFile(image);
    //Obtener url
    var imageUrl = await (await uploadTask).ref.getDownloadURL();
    url = imageUrl.toString();

    saveToDatabase(url, nameProduct, descripcion, price, quantity);
  }

  //Guardar datos a Realtime Database
  void saveToDatabase(String url, String nameProduct, String descripcion,
      String price, String quantity) {
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
    DatabaseReference ref = FirebaseDatabase.instance.ref('Productos');
    // Get a key for a new Post.
    final newPostKey = FirebaseDatabase.instance.ref('Productos').push().key;

    //Crear el cuerpo que se va a enviar
    var data = {
      'key': newPostKey,
      'image': url,
      'date': date,
      'time': time,
      'product': nameProduct,
      'description': descripcion,
      'price': price,
      'quantity': quantity,
      'email': authController.userEmail(),
      'favorito': 'false'
    };

    //Mandar los datos a la base de datos
    ref.push().set(data);
  }

  Future<void> updateDatabase(var newKeyList, int posicion, String nameProduct,
      String descripcion, String price, String quantity) async {
    try {
      String url = '';
      //Referenciar storage
      final storageRef = FirebaseStorage.instance.ref().child('Productos');
      //Tiempo actual
      DateTime timeKey = DateTime.now();
      //Agregar imagen a la carpeta
      final UploadTask uploadTask =
          storageRef.child('$timeKey.jpg').putFile(imageUpdate);
      //Obtener url
      var imageUrl = await (await uploadTask).ref.getDownloadURL();
      url = imageUrl.toString();
      //Tiempo actual
      var dbTimeKey = DateTime.now();
      //Formato de fecha
      var formatDate = DateFormat('MMM d, yyyy');
      //Formato del tiempo
      var formatTime = DateFormat('EEEE, hh:mm aaa');
      //Formatear en fecha y hora
      String date = formatDate.format(dbTimeKey);
      String time = formatTime.format(dbTimeKey);

      //Crear el cuerpo que se va a enviar
      var data = {
        'image': url,
        'date': date,
        'time': time,
        'product': nameProduct,
        'description': descripcion,
        'price': price,
        'quantity': quantity,
        'email': authController.userEmail()
      };

      FirebaseDatabase.instance
          .ref()
          .child('Productos')
          .child(newKeyList[posicion])
          .update(data);
    } catch (error) {
      print(error);
      return Future.error(error);
    }
  }

  Future pickImageUpdate() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final imageTemp = File(image.path);

      imageUpdate = imageTemp;
      // uploadStatusImage();
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImageCUpdate() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) return;

      final imageTemp = File(image.path);

      imageUpdate = imageTemp;
      //uploadStatusImage();
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<void> deleteDatabase(var newKeyList, int posicion) async {
    try {
      FirebaseDatabase.instance
          .ref()
          .child('Productos')
          .child(newKeyList[posicion])
          .remove();
    } catch (error) {
      print(error);
      return Future.error(error);
    }
  }

  //Guardar en la BD los productos vendidos
  void agregarProductosVendidos() {
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
    DatabaseReference ref = FirebaseDatabase.instance.ref('ProductosVendidos');
    for (var element in productosController.carrito) {
      for (var element2 in productosController.producto) {
        if (element.id == element2.id) {
//Crear el cuerpo que se va a enviar
          var data = {
            'key': element.id,
            'image': element.image,
            'date': date,
            'time': time,
            'product': element.nombre,
            'price': element.precio,
            'quantity': element.cantidad,
            'email': element2.email,
            'cantidadCarrito': element.cantidadCarrito
          };
          //Mandar los datos a la base de datos
          ref.push().set(data);
        }
      }
    }
  }

  //Guardar en la BD los productos comprados
  void agregarProductosComprados() {
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
    DatabaseReference ref = FirebaseDatabase.instance.ref('MisCompras');
    for (var element in productosController.carrito) {
//Crear el cuerpo que se va a enviar
      var data = {
        'key': element.id,
        'image': element.image,
        'date': date,
        'time': time,
        'product': element.nombre,
        'price': element.precio,
        'quantity': element.cantidad,
        'email': authController.userEmail(),
        'cantidadCarrito': element.cantidadCarrito
      };
      //Mandar los datos a la base de datos
      ref.push().set(data);
    }
  }
}
