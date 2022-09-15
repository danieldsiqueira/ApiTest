import 'package:uuid/uuid.dart';

class Customer {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatarImg;

  Customer({
    String? id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatarImg,
  }) : id = id ?? const Uuid().v4();
}
