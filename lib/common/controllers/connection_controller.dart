import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:mobx/mobx.dart';

part 'connection_controller.g.dart';

class ConnectionController = _ConnectionControllerBase
    with _$ConnectionController;

abstract class _ConnectionControllerBase with Store {
  _ConnectionControllerBase() {
    checkInternet();
  }
  bool _isDeviceConnected = true;
  bool _isInternetWorking = true;

  @readonly
  bool _haveInternet = true;

  @action
  Future<void> checkInternet() async {
    log('checkInternet');
    Timer.periodic(
      const Duration(seconds: 5),
      (timer) async {
        log('checkInternet periodic');
        await checkDeviceConnectivity();
        await checkInternetStatus();
        _haveInternet = _isDeviceConnected && _isInternetWorking;
      },
    );
  }

  Future<void> checkDeviceConnectivity() async {
    final result = await Connectivity().checkConnectivity();

    if (result == ConnectivityResult.none) {
      _isDeviceConnected = false;
    } else {
      _isDeviceConnected = true;
    }
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
}
