import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:teste_01/authentication/errors/auth_exception.dart';
import 'package:teste_01/authentication/models/customer.dart';

class CustomerRepository {
  Future<List<Customer>> getCustomers() async {
    try {
      const uri = 'https://reqres.in/api/users?page=2';
      // https://reqres.in/api/users?page=2 lista os usuarios
      // https://reqres.in/api/users/23 error 404

      var response = await http.get(Uri.parse(uri));
      log(response.body.toString());

      if (response.body.isEmpty) {
        throw AuthException('Lista vazia');
      }

      if (response.statusCode == 404) {
        throw AuthException('Não foi possível encontrar clientes.');
      }

      final map = jsonDecode(response.body);
      return listUsers(map['data']);
    } on SocketException catch (_) {
      throw AuthException('Bad request');
    }
  }

  List<Customer> listUsers(List<dynamic> map) {
    List<Customer> users = [];

    for (var userMap in map) {
      users.add(fromMap(userMap));
    }

    return users;
  }

  Map<String, dynamic> toMap(Customer user) => <String, dynamic>{
        'id': user.id,
        'email': user.email,
        'first_name': user.firstName,
        'last_name': user.lastName,
        'avatar_img': user.avatarImg,
      };

  Customer fromMap(Map<String, dynamic> map) => Customer(
      id: map['id'].toString(),
      email: map['email'] ?? '',
      firstName: map['first_name'] ?? '',
      lastName: map['last_name'] ?? '',
      avatarImg: map['avatar_img'] ?? '');
}
