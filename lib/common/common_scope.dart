import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teste_01/authentication/infra/data/customer_repository.dart';
import 'package:teste_01/authentication/infra/data/user_repository_local_impl.dart';
import 'package:teste_01/authentication/ui/login_view/login_view_model.dart';
import 'package:teste_01/common/model/environment.dart';

Future<void> initCommonScope() async {
  final c = GetIt.I;

  c.registerSingleton(Environment(
      baseUrl: dotenv.env['baseUrl']!, secret: dotenv.env['secret']!));
  c.registerSingletonAsync(() async {
    return await SharedPreferences.getInstance();
  });

  c.registerLazySingleton(() => CustomerRepository());
  c.registerFactory<LoginViewModel>(() => LoginViewModel());
  c.registerFactory(() => UserRepositoryLocal(c.get()));
}
