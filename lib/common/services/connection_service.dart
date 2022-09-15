import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:io';

class ConnectionService {
  bool _isDeviceConnected = true;

  bool _isInternetWorking = true;

  bool haveInternet() {
    checkDeviceConnectivity();
    checkInternetStatus();

    return _isDeviceConnected && _isInternetWorking;
  }

  void checkDeviceConnectivity() {
    Connectivity().onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.none) {
        _isDeviceConnected = false;
      } else {
        _isDeviceConnected = true;
      }
    });
  }

  Future<void> checkInternetStatus() async {
    try {
      final List<InternetAddress> result =
          await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        _isInternetWorking = true;
      }
    } on SocketException catch (_) {
      _isInternetWorking = false;
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConnectionService &&
          runtimeType == other.runtimeType &&
          haveInternet == other.haveInternet;

  @override
  int get hashCode => haveInternet.hashCode;
}
