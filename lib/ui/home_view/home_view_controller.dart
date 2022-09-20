import 'package:mobx/mobx.dart';
import 'package:teste_01/authentication/infra/data/customer_repository.dart';
import 'package:teste_01/authentication/models/customer.dart';

part 'home_view_controller.g.dart';

class HomeViewController = _HomeViewControllerBase with _$HomeViewController;

abstract class _HomeViewControllerBase with Store {
  final CustomerRepository _repository;

  _HomeViewControllerBase(this._repository) {
    getCustomers();
  }

  @readonly
  ObservableFuture<List<Customer>> _customers = ObservableFuture.value([]);

  @action
  void getCustomers() {
    _customers = _repository.getCustomers().asObservable();
  }
}
