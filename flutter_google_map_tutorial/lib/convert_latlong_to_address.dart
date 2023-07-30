import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';

class ConvertLatLongToAddress extends StatefulWidget {
  const ConvertLatLongToAddress({super.key});

  @override
  State<ConvertLatLongToAddress> createState() => _ConvertLatLongToAddressState();
}

class _ConvertLatLongToAddressState extends State<ConvertLatLongToAddress> {
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
          //get address-> lat long to address
          GestureDetector(
            onTap:() async{
              final coodinates = new Coordinates(22.647051 ,88.431686);
              var address = await Geocoder.local.findAddressesFromCoordinates(coodinates);
              var first = address.first;
              print("Address : "+first.featureName.toString() + first.addressLine.toString());
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

