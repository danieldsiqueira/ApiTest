import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:teste_01/authentication/infra/data/customer_repository.dart';
import 'package:teste_01/authentication/models/logged_user.dart';
import 'package:teste_01/authentication/models/user.dart';

final c = GetIt.instance;

void initLoginUserScope(User user) {
  c.pushNewScope();

  c.registerSingleton(() => LoggedUser(user: user));
  c.registerSingleton(() => CustomerRepository());
}

void popLoginUserScope() {
  log('Closing login scope');
  c.popScope();
}
