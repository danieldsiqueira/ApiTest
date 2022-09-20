import 'package:teste_01/authentication/models/user.dart';

class LoggedUser {
  final User user;
  DateTime? expiryTime;
  LoggedUser({required this.user, expiryTime})
      : expiryTime =
            expiryTime ?? DateTime.now().add(const Duration(seconds: 5));
}
