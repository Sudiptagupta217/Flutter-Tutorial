import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
    return Scaffold(
        appBar: AppBar(
          title: Text("home page"),
        ),
        body:

            // Center(
            // child: Container(
            //   color: Colors.blue.shade100,
            //   child: Center(
            //       child: Text("Flutter Container",
            //           style: TextStyle(
            //               fontSize: 23,
            //               color: Colors.white,
            //               fontWeight: FontWeight.w900,
            //               backgroundColor: Colors.amberAccent))),
            //
            // ),
            //  ),

            //   TextButton(
            //   child: Text("click here!!"),
            //   onPressed: () {
            //     print("text button clicked");
            //   },
            //   onLongPress: () {
            //     print("longpress!!");
            //   },
            // ),

            //     ElevatedButton(
            //   child: Text("elevated Button"),
            //   onPressed: () => print("elevater button clicked!"),
            // )

            // OutlinedButton(
            //   child: Text('outline btn'),
            //   onPressed: () => print('hello im working'),
            // )

            // Center(
            //     child: Container(
            //         width: 100,
            //         height: 100,
            //         child: Image.asset('assets/images/icon.png'))));

            //   Container(
            // // height: 400,
            // child: Column(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     ///Container(height: 100, width: 100, child: Image.asset('assets/images/icon.png')),
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceAround,
            //       children: [
            //         Text('A'),
            //         Text('B'),
            //         Text('C'),
            //         Text('D'),
            //         Text('E'),
            //         Text('F'),
            //         Text('G'),
            //         Text('H'),
            //       ],
            //     ),
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //       children: [
            //         Text('A vjx  kxxxc'),
            //         Text('B kx ploxxc x'),
            //         Text('C  js fofwwp pfw'),
            //         Text('D pow fwpo fwp'),
            //         Text('E ow efpo wfpw'),
            //         Text('F  fw fp wpf'),
            //         Text('G kfwpfpw'),
            //         Text('H f wpop pw wfo wofkowfka a')
            //       ],
            //     ),
            //
            //     // TextButton(onPressed: () => print("hello world"), child: Text('click'))
            //   ],
            // ),

            // Center(
            //   child: InkWell(
            //     onTap: () => print("hello"),
            //     onDoubleTap: () => print('hello hello'),
            //     onLongPress: ()=> print('hhhhheeeeellllllllllooooo'),
            //     child: Container(
            //       width: 200,
            //       height: 150,
            //       color: Colors.blue.shade700,
            //       child:
            //       Center(child: InkWell(
            //           child: Text('text btn', style: TextStyle(color: Colors.white)),
            //            onTap: () => print('text click'),
            //       )),
            //       ),
            //   ),
            // )

            SingleChildScrollView(
          child: Column(children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 200,
                    width: 200,
                    color: Colors.amberAccent,
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 200,
                    width: 200,
                    color: Colors.deepPurpleAccent,
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 200,
                    width: 200,
                    color: Colors.blue,
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 200,
                    width: 200,
                    color: Colors.lightGreen,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 200,
              color: Colors.green,
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 200,
              color: Colors.orange,
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 200,
              color: Colors.pink,
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 200,
              color: Colors.black,
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 200,
              color: Colors.purple,
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 200,
              color: Colors.cyan,
            )
          ]),
        )


    );
  }
}
