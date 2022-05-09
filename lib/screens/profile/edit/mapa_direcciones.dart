import 'dart:async';

import 'package:camp_express/controller/address_controller.dart';
import 'package:camp_express/domain/direccion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaDirecciones extends StatefulWidget {
  @override
  State<MapaDirecciones> createState() => MapaDireccionesState();
}

class MapaDireccionesState extends State<MapaDirecciones> {
  @override
  void initState() {
    super.initState();
    //getMarkers();
  }

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  // getMarkers() async {
  //   AddressController addressController = Get.find();
  //   await addressController.getAddresses();
  //   int cont = 0;
  //   for (Direccion i in addressController.addressesList) {
  //     Marker marker = Marker(
  //         markerId: MarkerId(cont.toString()),
  //         position: LatLng(double.parse(i.latitud), double.parse(i.longitud)),
  //         icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
  //         infoWindow: InfoWindow(
  //             title: "Hytech City",
  //             onTap: () {},
  //             snippet: "Snipet Hitech City"));
  //     // markers[MarkerId(cont.toString())] = marker;
  //     cont++;
  //   }
  // }

  Completer<GoogleMapController> _controller = Completer();

  // ignore: prefer_const_declarations
  static final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  // ignore: prefer_const_constructors
  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: const LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
          //mapType: MapType.hybrid,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          markers: Set<Marker>.of(markers.values)),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
