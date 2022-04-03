import 'package:flutter/material.dart';

Widget ordenItem(double total, DateTime date, List productos,
    List<String> cantidades, List precios) {
  return ExpansionTile(
    title: Text(
      total.toString() + '\$',
      style: const TextStyle(
          color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold),
    ),
    subtitle: Text(date.toString(),
        style: const TextStyle(
            color: Color.fromARGB(255, 78, 160, 62),
            fontSize: 15,
            fontWeight: FontWeight.bold)),
    children: <Widget>[
      ListTile(
        leading: Text(productos.join('\n'),
            style: const TextStyle(
                color: Color.fromARGB(255, 78, 160, 62),
                fontSize: 15,
                fontWeight: FontWeight.bold)),

        title: Text(
            cantidades.join(
              '\n',
            ),
            textDirection: TextDirection.rtl,
            style: const TextStyle(
                color: Color.fromARGB(255, 78, 160, 62),
                fontSize: 15,
                fontWeight: FontWeight.bold)),
        trailing: Text(precios.join('\n'),
            style: const TextStyle(
                color: Colors.black87,
                fontSize: 15,
                fontWeight: FontWeight.bold)),

        //  title: Text(precios.join('\n')),
      ),
    ],
    collapsedIconColor: const Color.fromARGB(255, 78, 160, 62),
    iconColor: const Color.fromARGB(255, 78, 160, 62),
  );
}
