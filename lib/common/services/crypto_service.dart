import 'dart:convert';
import 'dart:developer';

import 'package:crypto/crypto.dart';
import 'package:get_it/get_it.dart';
import 'package:teste_01/common/model/environment.dart';

class CryptoService {
  String hashPassword(String password) {
    final enviroment = GetIt.I.get<Environment>();

    final passwordBytes = utf8.encode(password);
    final secretBytes = utf8.encode(enviroment.secret);

    final passwordHashed =
        Hmac(sha256, passwordBytes).convert(secretBytes).toString();
    log(passwordHashed);
    return passwordHashed;
  }
}
