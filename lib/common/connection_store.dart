import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:io';
import 'package:mobx/mobx.dart';

part 'connection_store.g.dart';

class ConnectionStore = _ConnectionStoreBase with _$ConnectionStore;

abstract class _ConnectionStoreBase with Store {
  @readonly
  bool _isDeviceConnected = true;

  @readonly
  bool _isInternetWorking = true;

  @computed
  bool get haveInternet {
    checkDeviceConnectivity();
    checkInternetStatus();

    return _isDeviceConnected && _isInternetWorking;
  }

  @action
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
}
