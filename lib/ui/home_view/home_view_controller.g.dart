// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewController on _HomeViewControllerBase, Store {
  late final _$_customersAtom =
      Atom(name: '_HomeViewControllerBase._customers', context: context);

  ObservableFuture<List<Customer>> get customers {
    _$_customersAtom.reportRead();
    return super._customers;
  }

  @override
  ObservableFuture<List<Customer>> get _customers => customers;

  @override
  set _customers(ObservableFuture<List<Customer>> value) {
    _$_customersAtom.reportWrite(value, super._customers, () {
      super._customers = value;
    });
  }

  late final _$_HomeViewControllerBaseActionController =
      ActionController(name: '_HomeViewControllerBase', context: context);

  @override
  void getCustomers() {
    final _$actionInfo = _$_HomeViewControllerBaseActionController.startAction(
        name: '_HomeViewControllerBase.getCustomers');
    try {
      return super.getCustomers();
    } finally {
      _$_HomeViewControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
