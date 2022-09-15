import 'package:teste_01/authentication/models/customer.dart';

abstract class Repository {
  Future<List<Customer>?> getCustomers();
}
