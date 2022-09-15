import 'package:shared_preferences/shared_preferences.dart';
import 'package:teste_01/authentication/models/user.dart';
import 'package:teste_01/common/services/crypto_service.dart';

class UserRepositoryLocal {
  final SharedPreferences prefs;

  UserRepositoryLocal(this.prefs);

  User? getUser(String email, String password) {
    if (userExists(email)) {
      prefs.getString(email);
    }
    return null;
  }

  bool userExists(String email) {
    return prefs.getString(email) != null;
  }

  void saveUser(String email, String password) {
    final hashPassword = CryptoService().hashPassword(password);
    final user = User(email: email, password: hashPassword);

    prefs.setString(email, hashPassword);
  }
}
