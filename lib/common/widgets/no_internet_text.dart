import 'package:flutter/material.dart';

class NoInternetStatusText extends StatelessWidget {
  final VoidCallback callBack;
  const NoInternetStatusText({required this.callBack, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.wifi_off,
            size: 20,
          ),
          const Text('No internet connection detected'),
          ElevatedButton(onPressed: callBack, child: const Text('Try Again')),
        ],
      ),
    );
  }
}
