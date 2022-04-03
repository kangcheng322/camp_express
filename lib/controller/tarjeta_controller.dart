import 'package:camp_express/domain/tarjeta.dart';
import 'package:get/get.dart';

class TarjetaController extends GetxController {
  List<Tarjeta> listaTarjeta =
      <Tarjeta>[Tarjeta('5306123412341234', '01/25', '000', 'Lucia Perez')].obs;

  List<Tarjeta> get tarjeta => listaTarjeta;

  agregarTarjeta(Tarjeta tarjeta) {
    this.listaTarjeta.add(tarjeta);
    for (var card in this.listaTarjeta) {
      print(card.numero);
    }
  }
}
