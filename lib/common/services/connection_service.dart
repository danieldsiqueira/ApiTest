import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:io';

import 'package:flutter/cupertino.dart';

class ConnectionService extends ChangeNotifier {
  ConnectionService() {
    checkInternetStatus();
    checkDeviceConnectivity();
  }

  bool _isDeviceConnected = true;
  bool _isInternetWorking = true;
  late StreamSubscription connectionStream;

  bool get haveInternet {
    checkDeviceConnectivity();
    checkInternetStatus();

    return _isDeviceConnected && _isInternetWorking;
  }

  void checkDeviceConnectivity() {
    connectionStream = Connectivity().onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.none) {
        _isDeviceConnected = false;
        notifyListeners();
      } else {
        _isDeviceConnected = true;
        notifyListeners();
      }
    });
  }

  Future<void> checkInternetStatus() async {
    try {
      final List<InternetAddress> result =
          await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        _isInternetWorking = true;
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isInternetWorking = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    connectionStream.cancel();
    super.dispose();
  }
}
