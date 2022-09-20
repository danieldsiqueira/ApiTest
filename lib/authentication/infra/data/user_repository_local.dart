import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:teste_01/authentication/models/user.dart';

class UserRepositoryLocal {
  final SharedPreferences prefs;

  UserRepositoryLocal(this.prefs);

  User? getUser(String email, String password) {
    if (userExists(email)) {
      final userString = prefs.getString(email);

      if (userString == null) {
        return null;
      }
      return fromMap(json.decode(userString));
    }
    return null;
  }

  bool userExists(String email) {
    return prefs.getString(email) != null;
  }

  void saveUser(User user) {
    final userString = json.encode(user);
    log(userString);
    prefs.setString(user.email, userString);
  }

  User fromMap(Map<String, dynamic> userMap) => User(
        email: userMap['email'],
        password: userMap['password'],
      );
}
