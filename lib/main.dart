import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:teste_01/common/providers/connection_provider.dart';
import 'package:teste_01/common/providers/import_customers_provider.dart';
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
  final importCustomers = ImportCustomers();
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
        home: ImportCustomersProvider(
          importCustomers: importCustomers,
          child: const HomeView(),
        ),
      ),
    );
  }
}
