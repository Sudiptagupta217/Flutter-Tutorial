import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class ConvertLatLongToAddress extends StatefulWidget {
  const ConvertLatLongToAddress({super.key});

  @override
  State<ConvertLatLongToAddress> createState() => _ConvertLatLongToAddressState();
}

class _ConvertLatLongToAddressState extends State<ConvertLatLongToAddress> {

  String stAddress='';
  String stLatLng='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Map"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Text(stAddress,style: TextStyle(fontSize: 20),),
          Text(stLatLng,style: TextStyle(fontSize: 20),),

          GestureDetector(
            onTap:() async{

              // address to lat lng
              List<Location> locations = await locationFromAddress("A/17A/17, Nirmal Sen Gupta Sarani Rd, Milan Pally, Motilal Colony, Rajbari, Dum Dum, Kolkata, West Bengal 700079, India");


              // lat lang to address
              List<Placemark> placemarks = await placemarkFromCoordinates(22.647051 ,88.431686);

             setState(() {
               stLatLng = "${locations.last.longitude} ${locations.last.latitude}";
               stAddress = "${placemarks.reversed.last.country} -- ${placemarks.reversed.last.locality} -- ${placemarks.reversed.last.name}-- ${placemarks.reversed.first.street}";
             });

            },

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                decoration: const BoxDecoration(
                  color: Colors.green
                ),
                child: const Center(
                  child: Text("Convert"),
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}

