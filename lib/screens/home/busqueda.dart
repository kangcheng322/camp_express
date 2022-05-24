import 'package:camp_express/screens/details/detalles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/productos_controller.dart';
import '../../domain/productos.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);
  @override
  State<SearchPage> createState() => _SearchPageState();
}

// Search Page
class _SearchPageState extends State<SearchPage> {
  ProductosController productosController = Get.find();
  late TextEditingController _controller;
  List<Producto> a = <Producto>[];
  /*List<String> a = <String>[
    'Maiz',
    'Manzana',
    'Pera',
    'Piña',
    'Bolso artesanal',
    'Coco',
    'Papa',
    'Uva'
  ];*/
  List<Producto> b = <Producto>[];
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(_printLatestValue);
    a = productosController.producto;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    compararLista(_controller.text);
  }

  void compararLista(String text) {
    b.clear();
    if (text.isNotEmpty) {
      for (int i = 0; i < a.length; i++) {
        var producto = a.elementAt(i).nombre;
        if (producto.toLowerCase().contains(text.toLowerCase())) {
          b.add(a.elementAt(i));
        }
      }
    }
    setState(() {
      b;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        // The search area here
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: TextField(
              controller: _controller,
              autofocus: true,
              decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color.fromARGB(255, 78, 160, 62),
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _controller.text = '';
                    },
                    color: const Color.fromARGB(255, 78, 160, 62),
                  ),
                  hintText: 'Buscar...',
                  border: InputBorder.none),
              cursorColor: const Color.fromARGB(255, 78, 160, 62),
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 78, 160, 62),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //const SizedBox(height: 10),
          Expanded(
            child: ListView.separated(
              itemCount: b.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {
                    //Ocultar el teclado
                    final FocusScopeNode focus = FocusScope.of(context);
                    if (!focus.hasPrimaryFocus && focus.hasFocus) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    }
                    Get.to(
                      () => Detalles(
                        nombre: b.elementAt(index).nombre,
                        precio: b.elementAt(index).precio,
                        cantidad: b.elementAt(index).cantidad,
                        rating: b.elementAt(index).rating,
                        image: b.elementAt(index).image,
                        favorito: b.elementAt(index).favorito,
                        id: b.elementAt(index).id,
                        descripcion: b.elementAt(index).descripcion,
                      ),
                    );
                  },
                  iconColor: const Color.fromARGB(255, 78, 160, 62),
                  leading: Container(
                    color: Colors.transparent,
                    width: 55,
                    height: 55,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Container(
                          color: Colors.transparent,
                          width: 100.0,
                          height: 100.0,
                          child: Center(
                            child: Image.network(b.elementAt(index).image),
                          )),
                    ),
                  ),
                  title: Text(b.elementAt(index).nombre,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 78, 160, 62),
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  subtitle: Wrap(
                    direction: Axis.vertical,
                    //spacing: 12, // space between two icons
                    children: <Widget>[
                      Text(
                        b.elementAt(index).email,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        b.elementAt(index).precio.toString() + '\$',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  trailing: Wrap(
                    //spacing: 12, // space between two icons
                    children: <Widget>[
                      Text(
                        b.elementAt(index).rating.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.yellow[700],
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow[700],
                        size: 20,
                      ),
                    ],
                  ),
                  isThreeLine: true,
                );
              },
              separatorBuilder: (context, index) => const Divider(
                color: Color.fromARGB(255, 78, 160, 62),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
