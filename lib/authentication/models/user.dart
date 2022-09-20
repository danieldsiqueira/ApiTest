import 'package:uuid/uuid.dart';

class User {
  final String? id;
  final String email;
  final String password;

  User({
    id,
    required this.email,
    required this.password,
  }) : id = id ?? const Uuid().v4();
}
