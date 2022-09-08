import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:teste_01/authentication/commands/import_users_command.dart';
import 'package:teste_01/authentication/errors/auth_exception.dart';
import 'package:teste_01/authentication/models/user.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  final ImportUsersCommandHandler _importUsersCommandHandler;
  _HomeViewModelBase(this._importUsersCommandHandler) {
    importUsers();
  }

  @observable
  ObservableFuture<List<User>> listUsers = ObservableFuture.value([]);

  @action
  Future<void> importUsers() async {
    try {
      listUsers = _importUsersCommandHandler.handler().asObservable();
    } on AuthException catch (ex) {
      log(ex.message);
      return Future.error(ex.toString());
    }
  }
}
