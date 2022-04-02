import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Direccion extends StatefulWidget {
  const Direccion({Key? key}) : super(key: key);

  @override
  State<Direccion> createState() => _DireccionState();
}

class _DireccionState extends State<Direccion> {
  String dropdownvalue = 'C.C.';
  var items = [
    'C.C.',
    'C.E.',
  ];

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
            buildTextField("Dirección", "cra 23b # 60 -15", true),
            buildTextField("Barrio", "Los Andes", false),
            buildTextField("Ciudad", "Barranquilla", false),
            buildTextField("Celular", "3212220987", false),
            buildTextField("Nombre completo de tu documento de identidad",
                "Lucía Pérez Rodríguez", false),
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
                  child: buildTextField(
                      "Número del documento de identidad", "3212220987", false),
                )
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            ElevatedButton(
                onPressed: () {},
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
