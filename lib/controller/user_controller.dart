import 'package:camp_express/domain/usuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class UserController extends GetxController {
  //List<Usuario> usersList = [];
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

  Future<void> createUser(String name, String edad, String genero) async {
    try {
      final _firestore = FirebaseFirestore.instance;
      await _firestore.collection("users").add({
        "email": FirebaseAuth.instance.currentUser!.email,
        "id": FirebaseAuth.instance.currentUser!.uid,
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
      await _firestore.collection("users").doc(uid).update({
        "name": name,
        "edad": edad,
        "genero": genero,
      });

      return Future.value(true);
    } catch (e) {
      return Future.error(e);
    }
  }
}
