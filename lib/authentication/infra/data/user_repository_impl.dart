import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:teste_01/authentication/errors/auth_exception.dart';
import 'package:teste_01/authentication/models/user.dart';
import 'package:teste_01/common/repositories/repository.dart';

class UserRepositoryImpl extends Repository {
  final Dio _dio;

  UserRepositoryImpl(this._dio);

  @override
  Future<List<User>?> getUsers() async {
    try {
      var response = await _dio.get('/api/users?page=2');
      log(response.toString());

      if (response.data == null || response.data == 'null') {
        return null;
      }

      final map = jsonDecode(response.toString());

      return listUsers(map['data']);
    } on DioError catch (ex) {
      if (ex.response?.statusCode == 404) {
        throw AuthException('Não foi possível encontrar usuarios.');
      }
      throw AuthException('Erro ao tentar se conectar.');
    } catch (e) {
      rethrow;
    }
  }

  List<User> listUsers(List<dynamic> map) {
    List<User> users = [];

    for (var userMap in map) {
      users.add(fromMap(userMap));
    }

    return users;
  }

  Map<String, dynamic> toMap(User user) => <String, dynamic>{
        'id': user.id,
        'email': user.email,
        'first_name': user.firstName,
        'last_name': user.lastName,
        'avatar_img': user.avatarImg,
      };

  User fromMap(Map<String, dynamic> map) => User(
      id: map['id'].toString(),
      email: map['email'] ?? '',
      firstName: map['first_name'] ?? '',
      lastName: map['last_name'] ?? '',
      avatarImg: map['avatar_img'] ?? '');
}
