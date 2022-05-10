import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../controller/address_controller.dart';
import '../../../domain/direccion.dart';

class MapaDirecciones extends StatefulWidget {
  @override
  State<MapaDirecciones> createState() => MapSampleState();
}

class MapSampleState extends State<MapaDirecciones> {
  void initState() {
    super.initState();
    getMarkers();
  }

  Completer<GoogleMapController> _controller = Completer();

  // Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  final Set<Marker> markers = new Set();
  var myMarkers = HashSet<Marker>();

  testDireccion() {
    markers.add(Marker(
      //add first marker
      markerId: MarkerId('1'),
      position: LatLng(
          double.parse('30.7'), double.parse('27.8')), //position of marker
      infoWindow: InfoWindow(
        //popup info
        title: 'My Custom Title ',
        snippet: 'My Custom Subtitle',
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));
  }

  getMarkers() {
    AddressController addressController = Get.find();
    int cont = 0;
    for (Direccion i in addressController.addressesList) {
      printInfo(info: 'INFO => ' + i.latitud);
      Marker marker = Marker(
          markerId: MarkerId(cont.toString()),
          position: LatLng(double.parse(i.latitud), double.parse(i.longitud)),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
          infoWindow: InfoWindow(
              title: "Hytech City",
              onTap: () {},
              snippet: "Snipet Hitech City"));
      // markers[MarkerId(cont.toString())] = marker;
      cont++;
    }
    print('CONT => ' + cont.toString());
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        // mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          setState(() {
            AddressController addressController = Get.find();
            int cont = 0;
            for (Direccion i in addressController.addressesList) {
              myMarkers.add(
                Marker(
                    markerId: MarkerId(cont.toString()),
                    position: LatLng(
                        double.parse(i.latitud), double.parse(i.longitud))),
              );
              cont++;
            }
          });
        },
        markers: myMarkers,
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
