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


List<Marker> _marker =[];
final List<Marker> _list = const[
  Marker (
      markerId: MarkerId( '1'),
      position: LatLng(37.42796133580664, -122.085749655962),
      infoWindow: InfoWindow(
        title: "my position"
      )
  ),
  Marker (
      markerId: MarkerId( '2'),
      position: LatLng(37.65796133580664, -122.085749655962),
      infoWindow: InfoWindow(
          title: "my position"
      )
  ),
  Marker (
      markerId: MarkerId( '3'),
      position: LatLng(37.527961345480664, -122.085749655962),
      infoWindow: InfoWindow(
          title: "my position"
      )
  )
];

@override
  void initState() {
    super.initState();
    _marker.addAll(_list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _kGooglePlex,
       mapType: MapType.normal,
        markers: Set<Marker>.of(_marker),
        onMapCreated: (GoogleMapController controller){
          _controller.complete(controller);
         },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          GoogleMapController controller = await _controller.future;
          controller.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(
                target:LatLng(37.527961345480664, -122.085749655962),
              zoom: 14
            )
          ));
        },
        child: Icon(Icons.my_location),
      ),
    );
  }

}