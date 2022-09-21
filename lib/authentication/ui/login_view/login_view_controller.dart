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
  String? password = '';

  @observable
  String? confirmPassword = '';

  @observable
  bool isSignUp = false;

  @action
  void toggleSignUp() {
    isSignUp = !isSignUp;
  }

  @computed
  String? get errorEmailMessage {
    return Validators().email(email) ?? Validators().isEmpty(email);
  }

  @computed
  String? get errorConfirmPassword {
    return Validators().passwordMatch(password, confirmPassword);
  }

  @computed
  String? get errorPasswordMessage {
    return Validators().isEmpty(password) ??
        Validators().minCharacters(password);
  }

  void loginUser() {
    final loginCommandHandler = GetIt.I.get<LoginUserCommandHandler>();
    final command =
        LoginUserCommand(email: email ?? '', password: password ?? '');
    loginCommandHandler.handler(command);
  }

  void signUser() {}
}
