import 'package:teste_01/authentication/errors/auth_exception.dart';
import 'package:teste_01/authentication/infra/data/user_repository_local.dart';
import 'package:teste_01/authentication/login_scope.dart';
import 'package:teste_01/common/common_scope.dart';

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
    if (command.email.isEmpty || command.password.isEmpty) {
      throw AuthException('Pleas enter a email and password valid.');
    }
    final user = _repository.getUser(command.email, command.password);

    if (user == null) {
      throw AuthException('Usuário não encontrado');
    }

    LoginScope.initLoginUserScope(user);
  }
}
