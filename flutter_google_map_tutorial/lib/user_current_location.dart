import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UserCurrentLocation extends StatefulWidget {
  const UserCurrentLocation({super.key});

  @override
  State<UserCurrentLocation> createState() => _UserCurrentLocationState();
}

class _UserCurrentLocationState extends State<UserCurrentLocation> {
  Completer _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
      target:LatLng(37.42796133580664, -122.085749655962),
      zoom: 14.4746);

  final List<Marker> _markers = <Marker>[
    Marker (
        markerId: MarkerId( '1'),
        position: LatLng(37.42796133580664, -122.085749655962),
        infoWindow: InfoWindow(
            title: "my position"
        )
    ),

  ];

Future<Position> getUserCurrenrLocation()async{
await Geolocator.requestPermission().then((value) {

}).onError((error, stackTrace) {
  print("error"+error.toString());
});

return await Geolocator.getCurrentPosition();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _kGooglePlex,
        markers: Set<Marker>.of(_markers),
        onMapCreated: (controller) {
          _controller.complete(controller);
        },

      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
         getUserCurrenrLocation().then((value) async {
           print("my current location");
           print(value.latitude.toString()+""+value.longitude.toString());
           _markers.add(
             Marker(
                 markerId: MarkerId("2"),
                  position:LatLng(value.latitude,value.longitude),
                  infoWindow: InfoWindow(
                    title: "my current location"
                  )
             )
           );

           CameraPosition cameraPosition = CameraPosition(
             zoom: 14,
               target:LatLng(value.latitude, value.longitude));

           final GoogleMapController controller = await _controller.future;
           controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
           setState(() {

           });
         });
        },
        child: Icon(Icons.my_location),
      ),
    );
  }
}