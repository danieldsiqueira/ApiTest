import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:teste_01/common/connection_store.dart';

class ConnectionProvider extends ChangeNotifier {
  ConnectionProvider() {
    checkInternet();
  }

  ConnectionStore connectionStore = ConnectionStore();
  bool _haveInternet = true;
  bool get haveInternet => _haveInternet;

  late Timer _timer;

  void checkInternet() {
    log('checking internet');
    _timer = Timer.periodic(
      const Duration(seconds: 3),
      (timer) {
        log('checking internet timer');
        _haveInternet = connectionStore.haveInternet();
        notifyListeners();
      },
    );
  }
}

class ConnectionProviderInherited
    extends InheritedNotifier<ConnectionProvider> {
  final ConnectionProvider connectionProvider;

  const ConnectionProviderInherited({
    Key? key,
    required Widget child,
    required this.connectionProvider,
  }) : super(key: key, child: child, notifier: connectionProvider);

  static bool of(BuildContext context) =>
      context
          .dependOnInheritedWidgetOfExactType<ConnectionProviderInherited>()
          ?.connectionProvider
          .haveInternet ??
      true;
}
