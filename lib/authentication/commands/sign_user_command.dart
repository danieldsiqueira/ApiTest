import 'package:get_it/get_it.dart';
import 'package:teste_01/authentication/infra/data/user_repository_local.dart';
import 'package:teste_01/authentication/models/user.dart';
import 'package:teste_01/common/services/crypto_service.dart';

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
    final user =
        User(email: command.email, password: _hashPassword(command.password));
  }

  String _hashPassword(String password) {
    final cryptoService = GetIt.I.get<CryptoService>();
    return cryptoService.hashPassword(password);
  }
}
