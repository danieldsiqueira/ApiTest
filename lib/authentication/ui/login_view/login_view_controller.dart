import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:teste_01/authentication/commands/login_user_command.dart';
import 'package:teste_01/common/validators.dart';

part 'login_view_controller.g.dart';

class LoginViewController = _LoginViewControllerBase with _$LoginViewController;

abstract class _LoginViewControllerBase with Store {
  @observable
  String? email = '';

  @observable
  String? senha = '';

  @action
  String? errorEmailMessage() {
    return Validators().email(email) ?? Validators().isEmpty(email);
  }

  @action
  String? errorPasswordMessage() {
    return Validators().isEmpty(senha) ?? Validators().minCharacters(senha);
  }

  void loginUser() {
    final loginCommandHandler = GetIt.I.get<LoginUserCommandHandler>();
    final command = LoginUserCommand(email: email ?? '', password: senha ?? '');
    loginCommandHandler.handler(command);
  }

  void signUser() {}
}
