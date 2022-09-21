// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_view_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginViewController on _LoginViewControllerBase, Store {
  Computed<String?>? _$errorEmailMessageComputed;

  @override
  String? get errorEmailMessage => (_$errorEmailMessageComputed ??=
          Computed<String?>(() => super.errorEmailMessage,
              name: '_LoginViewControllerBase.errorEmailMessage'))
      .value;
  Computed<String?>? _$errorConfirmPasswordComputed;

  @override
  String? get errorConfirmPassword => (_$errorConfirmPasswordComputed ??=
          Computed<String?>(() => super.errorConfirmPassword,
              name: '_LoginViewControllerBase.errorConfirmPassword'))
      .value;
  Computed<String?>? _$errorPasswordMessageComputed;

  @override
  String? get errorPasswordMessage => (_$errorPasswordMessageComputed ??=
          Computed<String?>(() => super.errorPasswordMessage,
              name: '_LoginViewControllerBase.errorPasswordMessage'))
      .value;

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

  late final _$passwordAtom =
      Atom(name: '_LoginViewControllerBase.password', context: context);

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$confirmPasswordAtom =
      Atom(name: '_LoginViewControllerBase.confirmPassword', context: context);

  @override
  String? get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String? value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  late final _$isSignUpAtom =
      Atom(name: '_LoginViewControllerBase.isSignUp', context: context);

  @override
  bool get isSignUp {
    _$isSignUpAtom.reportRead();
    return super.isSignUp;
  }

  @override
  set isSignUp(bool value) {
    _$isSignUpAtom.reportWrite(value, super.isSignUp, () {
      super.isSignUp = value;
    });
  }

  late final _$_LoginViewControllerBaseActionController =
      ActionController(name: '_LoginViewControllerBase', context: context);

  @override
  void toggleSignUp() {
    final _$actionInfo = _$_LoginViewControllerBaseActionController.startAction(
        name: '_LoginViewControllerBase.toggleSignUp');
    try {
      return super.toggleSignUp();
    } finally {
      _$_LoginViewControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
confirmPassword: ${confirmPassword},
isSignUp: ${isSignUp},
errorEmailMessage: ${errorEmailMessage},
errorConfirmPassword: ${errorConfirmPassword},
errorPasswordMessage: ${errorPasswordMessage}
    ''';
  }
}
