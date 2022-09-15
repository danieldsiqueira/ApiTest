// import 'dart:developer';

// import 'package:teste_01/authentication/commands/import_users_command.dart';
// import 'package:teste_01/authentication/errors/auth_exception.dart';
// import 'package:teste_01/authentication/models/customer.dart';
// import 'package:teste_01/common/connection_store.dart';
// import 'package:teste_01/common/errors/app_exception.dart';

// class HomeViewModel {
//   final ImportUsersCommandProvider _importUsersCommandProvider;
//   final ConnectionStore _connectionStore;

//   HomeViewModel(
//     this._importUsersCommandProvider,
//     this._connectionStore,
//   );

//   Future<List<Customer>> listUsers = Future.value([]);

//   Future<void> importUsers() async {
//     try {
//       if (_connectionStore.haveInternet) {
//         listUsers = _importUsersCommandHandler.handler();
//       }
//     } on AuthException catch (ex) {
//       log(ex.message);
//       return Future.error(ex.toString());
//     } on AppException catch (ex) {
//       log(ex.message);
//       return Future.error(ex.toString());
//     }
//   }
// }
