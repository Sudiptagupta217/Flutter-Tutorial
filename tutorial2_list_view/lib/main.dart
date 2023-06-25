import 'package:flutter/material.dart';
import 'package:tutorial2/ui_helper/util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
              headline1: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              subtitle1: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var nameArr = [
      'abc1',
      'def0',
      'ghi9',
      'jkl8',
      'mno7',
      'pqr6',
      'stu5',
      'vwx4',
      'yza3',
      'bcd2',
      'efg1'
    ];
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'list view',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              elevation: 10,
                shadowColor: Colors.green,
                child: Center(
                    child: Text(
              nameArr[index],
              style: TextStyle(fontSize: 22),
            )));
          },
          itemCount: nameArr.length,
          itemExtent: 100,
          scrollDirection: Axis.vertical,
        )

        // ListView.separated(itemBuilder:(context,index){
        // return Text(nameArr[index], style:  TextStyle(fontSize: 20));
        // },
        //   itemCount: nameArr.length,
        //   separatorBuilder: (context, index) {
        //     return Divider(height: 50, thickness: 2);
        //   },
        // )

        //   ListView.builder(
        // itemBuilder: (context, index) {
        //   return ListTile(
        //       leading: CircleAvatar(backgroundImage: AssetImage('assets/images/icon2.png')),
        //       // title: Text(nameArr[index], style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.orange)),
        //       title: Text(nameArr[index], style: mTextStyle21()),
        //       subtitle: Text('number', style: mTextStyle11(textColor: Colors.green, fontWeight: FontWeight.w500),),
        //       trailing: Icon(Icons.add));
        // },
        // itemCount: nameArr.length,
        // // separatorBuilder: (context, index) {
        // //   return Divider(
        // //     height: 50,
        // //     thickness: 2,
        // //   );
        //},
        // )
        );
  }
}
