import 'package:get_it/get_it.dart';
import 'package:teste_01/authentication/commands/import_users_command.dart';
import 'package:teste_01/authentication/infra/data/user_repository_impl.dart';
import 'package:teste_01/common/repositories/repository.dart';
import 'package:teste_01/ui/home_view/home_view_model.dart';

Future<void> initCommonScope() async {
  final c = GetIt.I;

  c.registerFactory<Repository>(() => UserRepositoryImpl());
  c.registerFactory<ImportUsersCommandHandler>(
      () => ImportUsersCommandHandler(c.get()));
  c.registerFactory<HomeViewModel>(() => HomeViewModel(c.get()));
}
