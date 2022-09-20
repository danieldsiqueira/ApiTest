// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConnectionController on _ConnectionControllerBase, Store {
  late final _$_haveInternetAtom =
      Atom(name: '_ConnectionControllerBase._haveInternet', context: context);

  bool get haveInternet {
    _$_haveInternetAtom.reportRead();
    return super._haveInternet;
  }

  @override
  bool get _haveInternet => haveInternet;

  @override
  set _haveInternet(bool value) {
    _$_haveInternetAtom.reportWrite(value, super._haveInternet, () {
      super._haveInternet = value;
    });
  }

  late final _$checkInternetAsyncAction =
      AsyncAction('_ConnectionControllerBase.checkInternet', context: context);

  @override
  Future<void> checkInternet() {
    return _$checkInternetAsyncAction.run(() => super.checkInternet());
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
