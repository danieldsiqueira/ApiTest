import 'package:teste_01/common/validators.dart';

class LoginViewModel {
  String? email = '';

  String? senha = '';

  String? errorEmailMessage() {
    return Validators().email(email) ?? Validators().isEmpty(email);
  }

  String? errorPasswordMessage() {
    return Validators().isEmpty(senha) ?? Validators().minCharacters(senha);
  }
}
