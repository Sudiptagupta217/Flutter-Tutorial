import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutorial27_mvvm/utils/routes/routes.dart';
import 'package:tutorial27_mvvm/utils/routes/routes_name.dart';
import 'package:tutorial27_mvvm/view/login_view.dart';
import 'package:tutorial27_mvvm/view_model/auth_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers:
    [
      ChangeNotifierProvider(create: (_)=> AuthViewModel())
    ],
    child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
      ),
      initialRoute: RoutesName.login,
      onGenerateRoute: Routes.generateRoutes,
    )
    );
  }
}
