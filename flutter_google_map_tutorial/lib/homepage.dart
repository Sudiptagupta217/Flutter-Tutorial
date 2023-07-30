import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> HomePageState();
}

class HomePageState extends State<HomePage>{

  Completer _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
      target:LatLng(37.42796133580664, -122.085749655962),
  zoom: 14.4746);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _kGooglePlex,
       mapType: MapType.satellite,
        onMapCreated: (GoogleMapController controller){
          _controller.complete(controller);
         },
      ),
    );
  }

}