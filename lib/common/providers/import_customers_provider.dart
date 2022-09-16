import 'package:flutter/cupertino.dart';
import 'package:teste_01/authentication/infra/data/customer_repository.dart';
import 'package:teste_01/authentication/models/customer.dart';

class ImportCustomers extends ChangeNotifier {
  ImportCustomers() {
    getCustomers();
  }

  List<Customer> customers = [];
  final CustomerRepository _repository = CustomerRepository();

  Future<void> getCustomers() async {
    customers = await _repository.getCustomers();
    notifyListeners();
  }
}

class ImportCustomersProvider extends InheritedNotifier {
  final ImportCustomers importCustomers;
  const ImportCustomersProvider(
      {Key? key, required Widget child, required this.importCustomers})
      : super(key: key, child: child);

  static ImportCustomers of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ImportCustomersProvider>()!
        .importCustomers;
  }
}
