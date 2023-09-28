import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Models/ComplexJronExamplerModel.dart';

class ComplexJsonExample extends StatefulWidget {
  const ComplexJsonExample({super.key});

  @override
  State<ComplexJsonExample> createState() => _ComplexJsonExampleState();
}

class _ComplexJsonExampleState extends State<ComplexJsonExample> {
  Future<ComplexJronExamplerModel> getProductsApi() async {
    final response = await http.get(
        Uri.parse("https://webhook.site/3bb3914f-16ed-446e-98cc-a9a7f7c666a7"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return ComplexJronExamplerModel.fromJson(data);
    } else {
      return ComplexJronExamplerModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ComplexJsonExample")),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<ComplexJronExamplerModel>(
              future: getProductsApi(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.data!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ListTile(
                            title: Text(snapshot.data!.data![index].shop!.name
                                .toString()),
                            subtitle: Text(snapshot
                                .data!.data![index].shop!.shopemail
                                .toString()),
                            leading: CircleAvatar(
                                backgroundImage: NetworkImage(snapshot
                                    .data!.data![index].shop!.image
                                    .toString())),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.3,
                            width: MediaQuery.of(context).size.width * 1,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  snapshot.data!.data![index].images!.length,
                              itemBuilder: (context, position) {
                                return Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.25,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(snapshot
                                              .data!
                                              .data![index]
                                              .images![position]
                                              .url
                                              .toString()),
                                          fit: BoxFit.cover)),
                                );
                              },
                            ),
                          )
                        ],
                      );
                    },
                  );
                } else {
                  return Text("Loading");
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
