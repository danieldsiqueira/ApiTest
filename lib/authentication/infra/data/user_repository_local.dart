import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:teste_01/authentication/errors/auth_exception.dart';
import 'package:teste_01/authentication/models/user.dart';
import 'package:teste_01/common/services/crypto_service.dart';

class UserRepositoryLocal {
  final SharedPreferences prefs;

  UserRepositoryLocal(this.prefs);

  User? getUser(String email, String password) {
    if (userExists(email)) {
      final userString = prefs.getString(email);

      if (userString == null) {
        return null;
      }
      final user = fromMap(json.decode(userString));

      if (user.password != _hashPassword(password)) {
        throw AuthException('Password incorrect. Try "123456".');
      }

      return user;
    }
    return null;
  }

  bool userExists(String email) {
    return prefs.getString(email) != null;
  }

  void saveUser({
    required String email,
    required String password,
  }) {
    final user = User(email: email, password: _hashPassword(password));
    final userMap = toMap(user);
    final userString = json.encode(userMap);
    log(userString);
    prefs.setString(user.email, userString);
  }

  String _hashPassword(String password) {
    final cryptoService = CryptoService();
    return cryptoService.hashPassword(password);
  }

  User fromMap(Map<String, dynamic> userMap) => User(
        email: userMap['email'],
        password: userMap['password'],
      );

  Map<String, dynamic> toMap(User user) => {
        'id': user.id,
        'email': user.email,
        'password': user.password,
      };
}
