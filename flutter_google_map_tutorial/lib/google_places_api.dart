import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class GooglePlacesApiScreen extends StatefulWidget {
  const GooglePlacesApiScreen({super.key});

  @override
  State<GooglePlacesApiScreen> createState() => _GooglePlacesApiScreenState();
}

class _GooglePlacesApiScreenState extends State<GooglePlacesApiScreen> {
  TextEditingController _controller = TextEditingController();
  var uuid = Uuid();
  String _sessionToken = "123456";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller.addListener(() {
      onChanged();
    });
  }

  void onChanged(){
    if(_sessionToken == null) {
      setState(() {
        _sessionToken = uuid.v4();
      });
    }

    getSuggestion(_controller.text);
  }

  void getSuggestion(String input)async{

    String kPLACES_API_KEY="";
    String baseURL ='https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request = '$baseURL?input=$input&key=$kPLACES_API_KEY&sessiontoken=$_sessionToken';



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Screen Places Api"),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
         child: Column(
           children: [
             TextFormField(
               controller: _controller,
               decoration: InputDecoration(
                 hintText: 'Search place with name'
               ),
             )
           ],
         ),
      ),

    );
  }
}
