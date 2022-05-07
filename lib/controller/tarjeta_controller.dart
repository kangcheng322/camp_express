import 'package:camp_express/controller/user_controller.dart';
import 'package:camp_express/domain/tarjeta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../domain/usuario.dart';

class TarjetaController extends GetxController {
  List<Tarjeta> cardsList = <Tarjeta>[].obs;
  // List<Tarjeta> listaTarjeta =
  //     <Tarjeta>[Tarjeta('5306123412341234', '01/25', '000', 'Lucia Perez')].obs;

  // List<Tarjeta> get tarjeta => listaTarjeta;

  // agregarTarjeta(Tarjeta tarjeta) {
  //   this.listaTarjeta.add(tarjeta);
  //   for (var card in this.listaTarjeta) {
  //     print(card.numero);
  //   }
  // }

  Future<void> addCreditCard(String numero, String fecha, String cvv) async {
    try {
      final _firestore = FirebaseFirestore.instance;
      UserController userController = Get.find();
      Usuario currentUser = userController.user.value;
      await _firestore.collection("creditCards").add({
        "numero": numero,
        "fecha": fecha,
        "cvv": cvv,
        "uid": FirebaseAuth.instance.currentUser!.uid,
        "propietario": currentUser.name,
      });
      getCreditCards();
      return Future.value(true);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> getCreditCards() async {
    try {
      final _firestore = FirebaseFirestore.instance;
      var uid = FirebaseAuth.instance.currentUser!.uid;
      var sRef = _firestore.collection("tarjetas").where('uid', isEqualTo: uid);
      cardsList = [];
      QuerySnapshot Requests = await sRef.get();
      if (Requests.docs.isNotEmpty) {
        for (var doc in Requests.docs) {
          cardsList.add(Tarjeta(doc["numero"], doc["fecha"], doc["cvv"],
              doc["propietario"], doc["uid"]));
        }
      }
      return Future.value(true);
    } catch (e) {
      return Future.error(e);
    }
  }
}
