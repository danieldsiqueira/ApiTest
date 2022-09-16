import 'package:flutter/cupertino.dart';
import 'package:teste_01/authentication/infra/data/customer_repository.dart';
import 'package:teste_01/authentication/models/customer.dart';

class ImportCustomers extends ChangeNotifier {
  final CustomerRepository _repository;
  List<Customer> customers = [];

  ImportCustomers(this._repository) {
    getCustomers();
  }

  Future<void> getCustomers() async {
    customers = await _repository.getCustomers();
    notifyListeners();
  }
}
