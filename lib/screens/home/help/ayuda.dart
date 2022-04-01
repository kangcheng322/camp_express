import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

class Ayuda extends StatelessWidget {
  const Ayuda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 78, 160, 62),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // const SizedBox(height: 20),
            const Text(
              'Canales de atención',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 34,
                  color: Color.fromARGB(255, 78, 160, 62)),
            ),
            const SizedBox(height: 40),
            const Divider(
              color: Color.fromARGB(255, 78, 160, 62),
              height: 20,
            ),
            Card(
              child: ListTile(
                leading: Icon(
                  Icons.email_outlined,
                  color: Colors.red[900],
                  size: 30.0,
                ),
                title: const Text('camp_express@gmail.com',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 78, 160, 62))),
                tileColor: Colors.white.withOpacity(0.7),
              ),
            ),
            const Divider(
              color: Color.fromARGB(255, 78, 160, 62),
              height: 20,
            ),
            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.whatsapp,
                  color: Color.fromARGB(255, 78, 160, 62),
                  size: 30.0,
                ),
                title: const Text('3192220499',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 78, 160, 62))),
                tileColor: Colors.white.withOpacity(0.7),
              ),
            ),
            const Divider(
              color: Color.fromARGB(255, 78, 160, 62),
              height: 20,
            ),
            Card(
              child: ListTile(
                leading: Icon(
                  Icons.telegram,
                  color: Colors.blue[400],
                  size: 30.0,
                ),
                title: const Text('3212270498',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 78, 160, 62))),
                tileColor: Colors.white.withOpacity(0.7),
              ),
            ),
            const Divider(
              color: Color.fromARGB(255, 78, 160, 62),
              height: 20,
            ),
            Card(
              child: ListTile(
                leading: const Icon(
                  UniconsLine.phone,
                  color: Colors.black45,
                  size: 30.0,
                ),
                title: const Text(
                    'Línea de atención al cliente: 01-800-0912348',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 78, 160, 62))),
                tileColor: Colors.white.withOpacity(0.7),
              ),
            ),
            const Divider(
              color: Color.fromARGB(255, 78, 160, 62),
              height: 20,
            ),
            Card(
              child: ListTile(
                leading: Icon(
                  UniconsLine.facebook,
                  color: Colors.blue[600],
                  size: 30.0,
                ),
                title: const Text('Camp Express',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 78, 160, 62))),
                tileColor: Colors.white.withOpacity(0.7),
              ),
            ),
            const Divider(
              color: Color.fromARGB(255, 78, 160, 62),
              height: 20,
            ),
            Card(
              child: ListTile(
                leading: const Icon(
                  UniconsLine.instagram,
                  color: Colors.brown,
                  size: 30.0,
                ),
                title: const Text('Camp_Express',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 78, 160, 62))),
                tileColor: Colors.white.withOpacity(0.7),
              ),
            ),
            const Divider(
              color: Color.fromARGB(255, 78, 160, 62),
              height: 20,
            ),
            Card(
              child: ListTile(
                leading: const Icon(
                  UniconsLine.twitter,
                  color: Colors.blue,
                  size: 30.0,
                ),
                title: const Text('Camp Express Oficial',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 78, 160, 62))),
                tileColor: Colors.white.withOpacity(0.7),
              ),
            ),
            const Divider(
              color: Color.fromARGB(255, 78, 160, 62),
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
