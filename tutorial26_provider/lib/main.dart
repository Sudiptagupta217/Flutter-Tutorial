import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/providers/auth_provider.dart';
import 'package:provider_tutorial/providers/count_provider.dart';
import 'package:provider_tutorial/providers/example_one_provider.dart';
import 'package:provider_tutorial/providers/favourite_provider.dart';
import 'package:provider_tutorial/providers/theme_provider.dart';
import 'package:provider_tutorial/screen/count_example.dart';
import 'package:provider_tutorial/screen/daek_theme_screen.dart';
import 'package:provider_tutorial/screen/example_one_screen.dart';
import 'package:provider_tutorial/screen/favourite/favourite_screen.dart';
import 'package:provider_tutorial/screen/login_screen.dart';
import 'package:provider_tutorial/screen/valu_notify_listner.dart';
import 'package:provider_tutorial/statefull_widge_screen.dart';
import 'package:provider_tutorial/stateless_widget_screen.dart';
import 'package:provider_tutorial/why_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

  //  final themeChanger = Provider.of<ThemeChanger>(context);
    return MultiProvider(
      providers: [
      ChangeNotifierProvider(create: (_) =>  CountProvider(),),
      ChangeNotifierProvider(create: (_) =>  ExampleProvider(),),
      ChangeNotifierProvider(create: (_) =>  FavouriteItemProvider(),),
      ChangeNotifierProvider(create: (_) =>  ThemeChanger(),),
      ChangeNotifierProvider(create: (_) =>  AuthProvider(),),
      ],
        child:
        Builder(builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeChanger>(context);
          return  MaterialApp(
            title: 'Flutter Demo',
            themeMode:Provider.of<ThemeChanger>(context).themeMode,
            theme: ThemeData(
              brightness: Brightness.light,
              //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
             // useMaterial3: true,
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark
            ),
            home:   LoginScreen(),
          );
        },)


    );
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //     useMaterial3: true,
    //   ),
    //   home:  const CountExample(),
    // );
  }
}
