import 'package:camp_express/domain/direccion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../domain/tarjeta.dart';

class AddressController extends GetxController {
  List<Direccion> addressesList = <Direccion>[].obs;

  Future<void> addAddress(String address) async {
    try {
      final _firestore = FirebaseFirestore.instance;
      await _firestore.collection("direcciones").add({
        "direccion": address,
        "uid": FirebaseAuth.instance.currentUser!.uid,
      });
      return Future.value(true);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> getAddresses() async {
    try {
      final _firestore = FirebaseFirestore.instance;
      var uid = FirebaseAuth.instance.currentUser!.uid;
      var sRef =
          _firestore.collection("direcciones").where('uid', isEqualTo: uid);
      addressesList = [];
      QuerySnapshot Requests = await sRef.get();
      if (Requests.docs.isNotEmpty) {
        for (var doc in Requests.docs) {
          addressesList.add(Direccion(doc["direccion"], doc["uid"]));
        }
      }
      return Future.value(true);
    } catch (e) {
      return Future.error(e);
    }
  }
}
