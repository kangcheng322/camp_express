import 'package:camp_express/controller/address_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

class Direccion extends StatefulWidget {
  const Direccion({Key? key}) : super(key: key);

  @override
  State<Direccion> createState() => _DireccionState();
}

class _DireccionState extends State<Direccion> {
  String dropdownvalue = 'C.C.';
  final direccionController = TextEditingController();
  final barrioController = TextEditingController();
  final ciudadController = TextEditingController();
  final celularController = TextEditingController();
  final nombreController = TextEditingController();
  final numeroController = TextEditingController();
  var items = [
    'C.C.',
    'C.E.',
  ];
  var latitud = "";
  var longitud = "";

  Future<List<String>> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Location permissions are denied');
      } else if (permission == LocationPermission.deniedForever) {
        print("'Location permissions are permanently denied");
      } else {
        print("GPS Location service is granted");
      }
    } else {
      print("GPS Location permission granted.");
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    String long = position.longitude.toString();
    String lat = position.latitude.toString();

    printInfo(info: long);
    printInfo(info: lat);

    List<String> location = [];
    location.add(long);
    location.add(lat);

    this.latitud = lat;
    this.longitud = long;

    return location;
  }

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
          "Dirección de envío",
          style: TextStyle(
            color: Color.fromARGB(255, 78, 160, 62),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 16, top: 50, right: 16),
        child: ListView(
          children: [
            buildTextField(
                "Dirección", "cra 23b # 60 -15", true, direccionController),
            buildTextField("Barrio", "Los Andes", false, barrioController),
            buildTextField("Ciudad", "Barranquilla", false, ciudadController),
            buildTextField("Celular", "3212220987", false, celularController),
            buildTextField("Nombre completo de tu documento de identidad",
                "Lucía Pérez Rodríguez", false, nombreController),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: DropdownButton(
                    // Valor inicial
                    value: dropdownvalue,

                    // Icono flecha abajo
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Color.fromARGB(255, 78, 160, 62),
                    ),

                    // Array list de items
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // Mostrar en la primera posición el valor seleccionado
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                    style: const TextStyle(
                        color: Color.fromARGB(255, 78, 160, 62), fontSize: 15),
                    underline: Container(
                      height: 1,
                      color: const Color.fromARGB(255, 78, 160, 62),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  width: 300,
                  child: buildTextField("Número del documento de identidad",
                      "3212220987", false, numeroController),
                )
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            ElevatedButton(
                onPressed: () async {
                  List<String> list = await getCurrentLocation();
                  printInfo(info: list[0]);
                  printInfo(info: list[1]);
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
                child: const Text('Get current location')),
            ElevatedButton(
                onPressed: () {
                  AddressController addressController = Get.find();
                  addressController.addAddress(
                      direccionController.text,
                      barrioController.text,
                      celularController.text,
                      nombreController.text,
                      numeroController.text,
                      this.latitud,
                      this.longitud);
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
    );
  }

  Widget buildTextField(String labelText, String placeholder,
      bool isPasswordTextField, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
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
                  onPressed: () {},
                  icon: const Icon(
                    Icons.location_on_outlined,
                    color: Color.fromARGB(255, 78, 160, 62),
                  ),
                )
              : null,
          floatingLabelStyle:
              MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
            final Color color = states.contains(MaterialState.error)
                ? Theme.of(context).errorColor
                : const Color.fromARGB(255, 78, 160, 62);
            return TextStyle(color: color, letterSpacing: 1.3);
          }),
        ),
        style: const TextStyle(color: Colors.black87),
        cursorColor: Colors.black87,
      ),
    );
  }
}
