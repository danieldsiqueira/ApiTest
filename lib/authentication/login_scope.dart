import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:teste_01/authentication/infra/data/customer_repository.dart';
import 'package:teste_01/authentication/models/logged_user.dart';
import 'package:teste_01/authentication/models/user.dart';

final c = GetIt.instance;

class LoginScope {
  static void initLoginUserScope(User user) {
    log('initLoginUserScope');
    c.pushNewScope();

    final loggedSession = LoggedUser(user: user);
    c.registerSingleton(loggedSession);
    c.registerSingleton(() => CustomerRepository());
  }

  static void popLoginUserScope() {
    log('Closing login scope');
    c.popScope();
  }
}
