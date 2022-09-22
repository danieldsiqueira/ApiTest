import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teste_01/authentication/commands/login_user_command.dart';
import 'package:teste_01/authentication/commands/sign_user_command.dart';
import 'package:teste_01/authentication/infra/data/customer_repository.dart';
import 'package:teste_01/authentication/infra/data/user_repository_local.dart';
import 'package:teste_01/authentication/ui/login_view/login_view_controller.dart';
import 'package:teste_01/common/model/environment.dart';
import 'package:teste_01/common/controllers/connection_controller.dart';
import 'package:teste_01/common/services/crypto_service.dart';
import 'package:teste_01/ui/home_view/home_view_controller.dart';

Future<void> initCommonScope() async {
  final c = GetIt.I;

  c.registerSingleton(Environment(
      baseUrl: dotenv.env['baseUrl']!, secret: dotenv.env['secret']!));
  c.registerSingletonAsync(() async {
    return await SharedPreferences.getInstance();
  });
  c.registerLazySingleton(() => CryptoService());
  c.registerLazySingleton(() => CustomerRepository());

  c.registerLazySingleton(() => ConnectionController());
  c.registerFactory(() => LoginViewController());
  c.registerFactory(() => UserRepositoryLocal(c.get()));
  c.registerFactory(() => HomeViewController(c.get()));
  c.registerFactory(() => LoginUserCommandHandler(c.get()));
  c.registerFactory(() => SignUserCommandHandler(c.get()));
}
