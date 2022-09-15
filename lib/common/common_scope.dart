// import 'package:dio/dio.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:get_it/get_it.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:teste_01/authentication/commands/import_users_command.dart';
// import 'package:teste_01/authentication/infra/data/customer_repository_impl.dart';
// import 'package:teste_01/authentication/infra/data/user_repository_local_impl.dart';
// import 'package:teste_01/authentication/ui/login_view/login_view_model.dart';
// import 'package:teste_01/common/infrastructure/http/dio_factory.dart';
// import 'package:teste_01/common/model/environment.dart';
// import 'package:teste_01/common/repositories/repository.dart';
// import 'package:teste_01/common/connection_store.dart';
// import 'package:teste_01/ui/home_view/home_view_model.dart';

// Future<void> initCommonScope() async {
//   final c = GetIt.I;

//   c.registerHttpService();
//   c.registerSingleton(Environment(
//       baseUrl: dotenv.env['baseUrl']!, secret: dotenv.env['secret']!));
//   c.registerSingletonAsync(() async {
//     return await SharedPreferences.getInstance();
//   });

//   c.registerFactory<ImportUsersCommandHandler>(
//       () => ImportUsersCommandHandler(c.get()));
//   c.registerFactory<Repository>(() => CustomerRepositoryImpl(c.get()));
//   c.registerFactory<ConnectionStore>(() => ConnectionStore());
//   c.registerFactory<HomeViewModel>(() => HomeViewModel(c.get(), c.get()));
//   c.registerFactory<LoginViewModel>(() => LoginViewModel());
//   c.registerFactory(() => UserRepositoryLocal(c.get()));
// }

// extension GetItExt on GetIt {
//   void registerHttpService() {
//     return registerLazySingleton<Dio>(() => dioFactory());
//   }
// }
