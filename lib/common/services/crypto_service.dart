import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:teste_01/common/model/environment.dart';

class CryptoService {
  String hashPassword(String password) {
    final enviroment = Environment(
        baseUrl: dotenv.env['baseUrl']!, secret: dotenv.env['secret']!);

    final passwordBytes = utf8.encode(password);
    final secretBytes = utf8.encode(enviroment.secret);

    return Hmac(sha256, passwordBytes).convert(secretBytes).toString();
  }
}
