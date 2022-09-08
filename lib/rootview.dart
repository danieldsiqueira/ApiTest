import 'package:flutter/material.dart';

class RootView extends StatelessWidget {
  const RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [Center(child: Text('Hello'))],
        ),
      ),
    );
  }
}
