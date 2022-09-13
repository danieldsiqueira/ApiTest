import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:teste_01/authentication/commands/import_users_command.dart';
import 'package:teste_01/authentication/infra/data/user_repository_impl.dart';
import 'package:teste_01/authentication/ui/login_view/login_view_model.dart';
import 'package:teste_01/common/infrastructure/http/dio_factory.dart';
import 'package:teste_01/common/repositories/repository.dart';
import 'package:teste_01/common/connection_store.dart';
import 'package:teste_01/ui/home_view/home_view_model.dart';

Future<void> initCommonScope() async {
  final c = GetIt.I;

  c.registerHttpService();

  c.registerFactory<ImportUsersCommandHandler>(
      () => ImportUsersCommandHandler(c.get()));
  c.registerFactory<Repository>(() => UserRepositoryImpl(c.get()));
  c.registerFactory<ConnectionStore>(() => ConnectionStore());
  c.registerFactory<HomeViewModel>(() => HomeViewModel(c.get(), c.get()));
  c.registerFactory<LoginViewModel>(() => LoginViewModel());
}

extension GetItExt on GetIt {
  void registerHttpService() {
    return registerLazySingleton<Dio>(() => dioFactory());
  }
}
