import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:teste_01/authentication/commands/import_users_command.dart';
import 'package:teste_01/authentication/errors/auth_exception.dart';
import 'package:teste_01/authentication/models/user.dart';
import 'package:teste_01/common/connection_store.dart';
import 'package:teste_01/common/errors/app_exception.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  final ImportUsersCommandHandler _importUsersCommandHandler;
  final ConnectionStore _connectionStore;

  _HomeViewModelBase(
    this._importUsersCommandHandler,
    this._connectionStore,
  );

  @observable
  ObservableFuture<List<User>> listUsers = ObservableFuture.value([]);

  @action
  Future<void> importUsers() async {
    try {
      if (_connectionStore.haveInternet) {
        listUsers = _importUsersCommandHandler.handler().asObservable();
      }
    } on AuthException catch (ex) {
      log(ex.message);
      return Future.error(ex.toString());
    } on AppException catch (ex) {
      log(ex.message);
      return Future.error(ex.toString());
    }
  }
}
