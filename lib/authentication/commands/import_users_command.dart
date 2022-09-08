import 'package:teste_01/authentication/models/user.dart';
import 'package:teste_01/common/errors/app_exception.dart';
import 'package:teste_01/common/repositories/repository.dart';

class ImportUsersCommand {}

class ImportUsersCommandHandler {
  final Repository _repository;

  ImportUsersCommandHandler(this._repository);

  Future<List<User>> handler() async {
    final listUsers = await _repository.getUsers();

    if (listUsers == null) {
      throw AppException('Lista nula');
    }

    return listUsers;
  }
}
