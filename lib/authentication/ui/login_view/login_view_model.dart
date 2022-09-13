import 'package:mobx/mobx.dart';
import 'package:teste_01/common/validators.dart';

part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store {
  @observable
  String? email = '';

  @observable
  String? senha = '';

  @computed
  String? errorEmailMessage() {
    return Validators().email(email) ?? Validators().isEmpty(email);
  }

  @computed
  String? errorPasswordMessage() {
    return Validators().isEmpty(senha) ?? Validators().minCharacters(senha);
  }
}
