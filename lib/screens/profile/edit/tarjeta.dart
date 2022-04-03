import 'package:camp_express/controller/tarjeta_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../edit/agregar_tarjeta.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class Tarjeta extends StatefulWidget {
  const Tarjeta({Key? key}) : super(key: key);

  @override
  State<Tarjeta> createState() => _TarjetaState();
}

class _TarjetaState extends State<Tarjeta> {
  bool showPassword = false;
  TarjetaController tarjetaController = Get.find();
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
          },
          icon: const Icon(Icons.arrow_back,
              color: Color.fromARGB(255, 78, 160, 62)),
        ),
        title: const Text(
          "Mis tarjetas",
          style: TextStyle(
            color: Color.fromARGB(255, 78, 160, 62),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ListView.separated(
                  itemCount: tarjetaController.listaTarjeta.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CreditCardWidget(
                      cardNumber: tarjetaController.listaTarjeta[index].numero,
                      expiryDate: tarjetaController.listaTarjeta[index].fecha,
                      cardHolderName:
                          tarjetaController.listaTarjeta[index].propietario,
                      cvvCode: tarjetaController.listaTarjeta[index].cvv,
                      showBackView: false,
                      isHolderNameVisible: true,
                      cardBgColor: Colors.green,
                      onCreditCardWidgetChange:
                          (CreditCardBrand) {}, //true when you want to show cvv(back) view
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                )),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: ElevatedButton(
                onPressed: () {
                  var nowTime = DateTime.now();
                  Get.to(() => const AgregarTarjeta());
                  print(nowTime);
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
                child: const Text('Agregar nueva tarjeta')),
          ),
        ],
      ),
    );
  }
}
