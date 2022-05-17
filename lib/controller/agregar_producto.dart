import 'dart:io';
import 'package:camp_express/controller/auth_controller.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AgregarProductoController extends GetxController {
  final _image = File('').obs;
  AuthController authController = Get.find(); 

  File get image {
    print('Entro ${_image.value}');
    return _image.value;
  }

  set image(File file) {
    _image.value = file;
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
  void uploadStatusImage(String nameProduct, String descripcion, String price, String quantity) async {
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
  void saveToDatabase(String url, String nameProduct, String descripcion, String price, String quantity) {
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
    //Crear el cuerpo que se va a enviar
    var data = {'image': url, 'date': date, 'time': time, 
                'product': nameProduct, 
                'description': descripcion, 
                'price': price, 
                'quantity':quantity,
                'email': authController.userEmail() };
    //Mandar los datos a la base de datos
    ref.push().set(data);
    // getValues();
  }
}
