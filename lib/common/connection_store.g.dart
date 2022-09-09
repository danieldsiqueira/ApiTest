// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConnectionStore on _ConnectionStoreBase, Store {
  Computed<bool>? _$haveInternetComputed;

  @override
  bool get haveInternet =>
      (_$haveInternetComputed ??= Computed<bool>(() => super.haveInternet,
              name: '_ConnectionStoreBase.haveInternet'))
          .value;

  late final _$_isDeviceConnectedAtom =
      Atom(name: '_ConnectionStoreBase._isDeviceConnected', context: context);

  bool get isDeviceConnected {
    _$_isDeviceConnectedAtom.reportRead();
    return super._isDeviceConnected;
  }

  @override
  bool get _isDeviceConnected => isDeviceConnected;

  @override
  set _isDeviceConnected(bool value) {
    _$_isDeviceConnectedAtom.reportWrite(value, super._isDeviceConnected, () {
      super._isDeviceConnected = value;
    });
  }

  late final _$_isInternetWorkingAtom =
      Atom(name: '_ConnectionStoreBase._isInternetWorking', context: context);

  bool get isInternetWorking {
    _$_isInternetWorkingAtom.reportRead();
    return super._isInternetWorking;
  }

  @override
  bool get _isInternetWorking => isInternetWorking;

  @override
  set _isInternetWorking(bool value) {
    _$_isInternetWorkingAtom.reportWrite(value, super._isInternetWorking, () {
      super._isInternetWorking = value;
    });
  }

  late final _$checkDeviceConnectivityAsyncAction = AsyncAction(
      '_ConnectionStoreBase.checkDeviceConnectivity',
      context: context);

  @override
  Future<void> checkDeviceConnectivity() {
    return _$checkDeviceConnectivityAsyncAction
        .run(() => super.checkDeviceConnectivity());
  }

  @override
  String toString() {
    return '''
haveInternet: ${haveInternet}
    ''';
  }
}
