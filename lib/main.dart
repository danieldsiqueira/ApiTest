import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:teste_01/common/providers/connection_provider.dart';
import 'package:teste_01/common/routes.dart';
import 'package:teste_01/ui/home_view/home_view.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  // await initCommonScope();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final connectionProvider = ConnectionProvider();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ConnectionProviderInherited(
      connectionProvider: connectionProvider,
      child: MaterialApp(
        title: 'Flutter Demo',
        routes: getRoutes(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: HomeView.route,
      ),
    );
  }
}
