import 'package:get_it/get_it.dart';
import 'package:teste_01/authentication/commands/login_user_command.dart';
import 'package:teste_01/authentication/errors/auth_exception.dart';
import 'package:teste_01/authentication/infra/data/user_repository_local.dart';

class SignUserCommand {
  final String email;
  final String password;

  SignUserCommand({
    required this.email,
    required this.password,
  });
}

class SignUserCommandHandler {
  final UserRepositoryLocal userRepositoryLocal;
  SignUserCommandHandler(this.userRepositoryLocal);

  void handler(SignUserCommand command) {
    if (command.email.isEmpty || command.password.isEmpty) {
      throw AuthException('Please, enter a email and password to Sign In.');
    }

    final userExist = userRepositoryLocal.userExists(command.email);

    if (userExist) {
      throw AuthException('This user already exists, try login instead.');
    }

    userRepositoryLocal.saveUser(
      email: command.email,
      password: command.password,
    );

    final loginCommand =
        LoginUserCommand(email: command.email, password: command.password);

    final loginCommandHandler = GetIt.I.get<LoginUserCommandHandler>();
    loginCommandHandler.handler(loginCommand);
  }
}
