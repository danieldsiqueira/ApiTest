import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:teste_01/authentication/ui/login_view/login_view.dart';
import 'package:teste_01/common/common_scope.dart';
import 'package:teste_01/common/routes.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  await initCommonScope();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: getRoutes(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: LoginView.route,
    );
  }
}
