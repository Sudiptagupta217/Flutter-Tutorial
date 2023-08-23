import 'dart:async';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<String> list =[];

  StreamSocket streamSocket = StreamSocket();

  TextEditingController message = TextEditingController();

  Stream generateNumber() async*{
    while(true) {
      await Future.delayed(Duration(seconds: 1));
      yield DateTime.now();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    streamSocket.addResponse(list);
  }

  @override
  Widget build(BuildContext context) {
    print("ok rune");
    return Scaffold(
      appBar: AppBar(
        title: Text("Stream"),
      ),
      body: Column(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: StreamBuilder(
            //  stream: generateNumber(),
              stream:  streamSocket.getResponse,
                builder:(context,AsyncSnapshot<List<String>> snapshot) {
                 if(snapshot.connectionState==ConnectionState.waiting){
                   return const Center(child: CircularProgressIndicator());
                 }
                 else if(snapshot.connectionState == ConnectionState.active ||
                 snapshot.connectionState == ConnectionState.done) {

                   if(snapshot.hasError){
                     return Text(snapshot.error.toString());
                   }else if(snapshot.hasData){
                     return ListView.builder(
                       itemCount: list.length,
                         itemBuilder: (context, index) =>
                       Text(snapshot.data![index].toString()));
                   }else{
                     return Text("Something went wrong");
                   }

                   return Center(child: Text(
                     snapshot.data.toString(), style: TextStyle(fontSize: 20),));
                 }
                 else{
                   return Text("Something went wrong");
                 }
                  },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(controller: message,
                decoration: InputDecoration(
                  hintText: 'enter message'
                ),),
              ),
              IconButton(onPressed: (){
               list.add(message.text.toString());
               streamSocket.addResponse(list);
               message.clear();
              }, icon: Icon(Icons.send))
            ],
          )

        ],
      ),
    );
  }
}

class StreamSocket{
final _stream = StreamController<List<String>>.broadcast();

void Function(List<String>) get addResponse => _stream.sink.add;

Stream<List<String>> get getResponse => _stream.stream.asBroadcastStream();


}