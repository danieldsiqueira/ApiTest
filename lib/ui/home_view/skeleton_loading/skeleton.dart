import 'package:flutter/material.dart';

class SkeletonLoading extends StatelessWidget {
  const SkeletonLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              color: Colors.black12,
              height: 70,
            ),
            const SizedBox(
              height: 8,
            )
          ],
        );
      },
    );
  }
}
