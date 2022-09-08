import 'package:teste_01/authentication/models/user.dart';

abstract class Repository {
  Future<List<User>?> getUsers();
}
