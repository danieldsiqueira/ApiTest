// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_view_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginViewController on _LoginViewControllerBase, Store {
  late final _$emailAtom =
      Atom(name: '_LoginViewControllerBase.email', context: context);

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$senhaAtom =
      Atom(name: '_LoginViewControllerBase.senha', context: context);

  @override
  String? get senha {
    _$senhaAtom.reportRead();
    return super.senha;
  }

  @override
  set senha(String? value) {
    _$senhaAtom.reportWrite(value, super.senha, () {
      super.senha = value;
    });
  }

  late final _$_LoginViewControllerBaseActionController =
      ActionController(name: '_LoginViewControllerBase', context: context);

  @override
  String? errorEmailMessage() {
    final _$actionInfo = _$_LoginViewControllerBaseActionController.startAction(
        name: '_LoginViewControllerBase.errorEmailMessage');
    try {
      return super.errorEmailMessage();
    } finally {
      _$_LoginViewControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? errorPasswordMessage() {
    final _$actionInfo = _$_LoginViewControllerBaseActionController.startAction(
        name: '_LoginViewControllerBase.errorPasswordMessage');
    try {
      return super.errorPasswordMessage();
    } finally {
      _$_LoginViewControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
senha: ${senha}
    ''';
  }
}
