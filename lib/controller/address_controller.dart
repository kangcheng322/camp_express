import 'package:camp_express/domain/direccion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../domain/tarjeta.dart';

class AddressController extends GetxController {
  List<Direccion> addressesList = <Direccion>[].obs;

  Future<void> addAddress(String direccion, String barrio, String celular,
      String nombre, String numero, String latutud, String longitud) async {
    try {
      final _firestore = FirebaseFirestore.instance;
      await _firestore.collection("direcciones").add({
        "direccion": direccion,
        "barrio": barrio,
        "celular": celular,
        "nombre": nombre,
        "numero": numero,
        "latitud": latutud,
        "longitud": longitud,
        "email": FirebaseAuth.instance.currentUser!.email,
      });
      printInfo(info: "Entró a addAdress");
      return Future.value(true);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> getAddresses() async {
    try {
      final _firestore = FirebaseFirestore.instance;
      var email = FirebaseAuth.instance.currentUser!.email;
      var sRef =
          _firestore.collection("direcciones").where('email', isEqualTo: email);
      addressesList = [];
      QuerySnapshot Requests = await sRef.get();
      if (Requests.docs.isNotEmpty) {
        for (var doc in Requests.docs) {
          addressesList.add(Direccion(
              doc["direccion"],
              doc["barrio"],
              doc["celular"],
              doc["nombre"],
              doc["numero"],
              doc["latitud"],
              doc["longitud"],
              doc["email"]));
        }
      }
      return Future.value(true);
    } catch (e) {
      return Future.error(e);
    }
  }
}
