import 'package:get_it/get_it.dart';
import 'package:teste_01/authentication/errors/auth_exception.dart';
import 'package:teste_01/authentication/infra/data/user_repository_local.dart';
import 'package:teste_01/authentication/init_user_scope.dart';
import 'package:teste_01/common/repositories/repository.dart';
import 'package:teste_01/common/services/crypto_service.dart';

class LoginUserCommand {
  final String email;
  final String password;

  LoginUserCommand({
    required this.email,
    required this.password,
  });
}

class LoginUserCommandHandler {
  final UserRepositoryLocal _repository;

  LoginUserCommandHandler(this._repository);

  void handler(LoginUserCommand command) {
    final cryptoService = GetIt.I.get<CryptoService>();
    final hashPassword = cryptoService.hashPassword(command.password);

    final user = _repository.getUser(command.email, hashPassword);

    if (user == null) {
      throw AuthException('Usuário não encontrado');
    }

    initLoginUserScope(user);
  }
}
