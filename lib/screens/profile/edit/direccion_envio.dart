import 'package:camp_express/controller/address_controller.dart';
import 'package:camp_express/screens/profile/perfil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocode/geocode.dart';
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
  bool currentLocation = false;

  bool validateData() {
    if (direccionController.text == "" || direccionController.text.isEmpty) {
      Get.snackbar('Error', 'Por favor escriba una dirección',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xFF808080),
          colorText: Colors.white,
          borderRadius: 10,
          margin: EdgeInsets.all(10),
          snackStyle: SnackStyle.FLOATING,
          duration: Duration(seconds: 3));
      return false;
    }

    if (barrioController.text == "" || barrioController.text.isEmpty) {
      Get.snackbar('Error', 'Por favor escriba un barrio',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xFF808080),
          colorText: Colors.white,
          borderRadius: 10,
          margin: EdgeInsets.all(10),
          snackStyle: SnackStyle.FLOATING,
          duration: Duration(seconds: 3));
      return false;
    }

    if (ciudadController.text == "" || ciudadController.text.isEmpty) {
      Get.snackbar('Error', 'Por favor escriba una ciudad',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xFF808080),
          colorText: Colors.white,
          borderRadius: 10,
          margin: EdgeInsets.all(10),
          snackStyle: SnackStyle.FLOATING,
          duration: Duration(seconds: 3));
      return false;
    }

    if (celularController.text == "" || celularController.text.isEmpty) {
      Get.snackbar('Error', 'Por favor escriba un celular',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xFF808080),
          colorText: Colors.white,
          borderRadius: 10,
          margin: EdgeInsets.all(10),
          snackStyle: SnackStyle.FLOATING,
          duration: Duration(seconds: 3));
      return false;
    }

    if (nombreController.text == "" || nombreController.text.isEmpty) {
      Get.snackbar('Error', 'Por favor escriba un nombre',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xFF808080),
          colorText: Colors.white,
          borderRadius: 10,
          margin: EdgeInsets.all(10),
          snackStyle: SnackStyle.FLOATING,
          duration: Duration(seconds: 3));
      return false;
    }

    if (numeroController.text == "" || numeroController.text.isEmpty) {
      Get.snackbar('Error', 'Ingrese su documento de identidad',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xFF808080),
          colorText: Colors.white,
          borderRadius: 10,
          margin: EdgeInsets.all(10),
          snackStyle: SnackStyle.FLOATING,
          duration: Duration(seconds: 3));
      return false;
    }

    return true;
  }

  Future<void> addressToLocation(String direccion) async {
    GeoCode geoCode = GeoCode();

    try {
      Coordinates coordinates =
          await geoCode.forwardGeocoding(address: direccion);
      latitud = coordinates.latitude.toString();
      longitud = coordinates.longitude.toString();
      printInfo(info: latitud);
      printInfo(info: longitud);
    } catch (e) {
      print(e);
    }
  }

  Future<void> getCurrentLocation() async {
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

    latitud = lat;
    longitud = long;
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
            // buildTextField("Dirección", "cra 23b # 60 -15", true),
            // buildTextField("Barrio", "Los Andes", false),
            // buildTextField("Ciudad", "Barranquilla", false),
            // buildTextField("Celular", "3212220987", false),
            // buildTextField("Nombre completo de tu documento de identidad",
            //     "Lucía Pérez Rodríguez", false),
            Padding(
              padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: TextFormField(
                controller: direccionController,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Color(0xFFF6F6F6),
                    labelText: 'Dirección'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: TextFormField(
                controller: barrioController,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Color(0xFFF6F6F6),
                    labelText: 'Barrio'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: TextFormField(
                controller: ciudadController,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Color(0xFFF6F6F6),
                    labelText: 'Ciudad'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: TextFormField(
                controller: celularController,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Color(0xFFF6F6F6),
                    labelText: 'Celular'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: TextFormField(
                controller: nombreController,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Color(0xFFF6F6F6),
                    labelText: 'Nombre'),
              ),
            ),
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
                  // child: buildTextField(
                  //     "Número del documento de identidad", "3212220987", false),
                  child: Padding(
                    padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                    child: TextFormField(
                      controller: numeroController,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Color(0xFFF6F6F6),
                          labelText: 'Número de identidad'),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            // ElevatedButton(
            //     onPressed: () async {
            //       await getCurrentLocation();
            //       setState(() {
            //         currentLocation = true;
            //       });
            //     },
            //     style: ElevatedButton.styleFrom(
            //         primary: const Color.fromARGB(255, 78, 160, 62),
            //         fixedSize: const Size(314.0, 70.0),
            //         onPrimary: const Color.fromARGB(255, 255, 255, 255),
            //         shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(10.0)),
            //         padding: const EdgeInsets.symmetric(vertical: 22),
            //         textStyle: const TextStyle(
            //             fontSize: 20, fontWeight: FontWeight.w700)),
            //     child: const Text('Get current location')),
            ElevatedButton(
                onPressed: () async {
                  if (validateData()) {
                    await getCurrentLocation();

                    AddressController addressController = Get.find();
                    await addressController.addAddress(
                        direccionController.text,
                        barrioController.text,
                        celularController.text,
                        nombreController.text,
                        numeroController.text,
                        latitud,
                        longitud);

                    setState(() {
                      currentLocation = true;
                      latitud = "";
                      longitud = "";
                    });
                    Get.to(() => const Perfil());
                  }
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

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
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
