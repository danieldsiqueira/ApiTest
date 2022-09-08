import 'package:flutter/material.dart';
import 'package:teste_01/common/common_scope.dart';
import 'package:teste_01/ui/home_view/home_view.dart';

void main() async {
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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeView(),
    );
  }
}
