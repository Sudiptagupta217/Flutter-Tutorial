import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/providers/favourite_provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

//List<int> selectedItem =[];
class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    //final favouritProvider= Provider.of<FavouriteItemProvider>(context);
    print("build");
    return Scaffold(
      appBar: AppBar(title: Text("Favourite")),
      body: Column(
         children: [
           Expanded(
             child: ListView.builder(
               itemCount: 100,
               itemBuilder: (context, index) {
               return Consumer<FavouriteItemProvider>(builder: (context, value, child){
                 return  ListTile(
                     onTap: () {
                       // selectedItem.add(index);
                       //setState(() {});

                       if(value.selectedItem.contains(index)){
                         value.removeItem(index);
                       }else{
                         value.addItem(index);
                       }
                     },
                     title: Text('Item '+ index.toString()),
                     trailing: Icon(value.selectedItem.contains(index)? Icons.favorite: Icons.favorite_border_outlined),
                   );
                 },);
             },),
           )
         ],
      ),
    );
  }
}
