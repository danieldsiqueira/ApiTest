import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:teste_01/common/connection_store.dart';

class ConnectionProvider extends StatefulWidget {
  final Widget child;
  const ConnectionProvider({Key? key, required this.child}) : super(key: key);

  @override
  State<ConnectionProvider> createState() => _ConnectionProviderState();
}

class _ConnectionProviderState extends State<ConnectionProvider> {
  ConnectionStore connectionStore = ConnectionStore();
  bool haveInternet = true;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    checkInternet();
  }

  void checkInternet() {
    log('checking internet');
    _timer = Timer.periodic(
      const Duration(seconds: 3),
      (timer) {
        log('checking internet timer');

        setState(() {
          haveInternet = connectionStore.haveInternet();
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ConnectionProviderInherited(
        connectionStore: haveInternet,
        connectionProviderState: this,
        child: widget.child);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

class ConnectionProviderInherited extends InheritedWidget {
  final bool connectionStore;
  final _ConnectionProviderState connectionProviderState;

  const ConnectionProviderInherited({
    Key? key,
    required Widget child,
    required this.connectionStore,
    required this.connectionProviderState,
  }) : super(key: key, child: child);

  static _ConnectionProviderState of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<ConnectionProviderInherited>()!
      .connectionProviderState;

  @override
  bool updateShouldNotify(ConnectionProviderInherited oldWidget) {
    return oldWidget.connectionStore != connectionStore;
  }
}
