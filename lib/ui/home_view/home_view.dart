import 'package:flutter/material.dart';
import 'package:teste_01/authentication/errors/auth_exception.dart';

import 'package:teste_01/common/extensions/iterable_extension.dart';
import 'package:teste_01/authentication/infra/data/customer_repository.dart';
import 'package:teste_01/authentication/models/customer.dart';
import 'package:teste_01/common/providers/connection_provider.dart';
import 'package:teste_01/common/providers/import_customers_provider.dart';
import 'package:teste_01/common/widgets/no_internet_text.dart';

class HomeView extends StatefulWidget {
  static const route = 'homeView';

  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final repository = CustomerRepository();
  final connectionProvider = ConnectionProvider();
  late List<Customer> customers;
  Exception? exception;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final hasConnectionToInternet = ConnectionProviderInherited.of(context);
    final importCustomerProvider = ImportCustomersProvider.of(context);

    return Scaffold(
        appBar: AppBar(title: const Text('Teste')),
        body: hasConnectionToInternet
            ? Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : exception == null
                          ? CardItem(
                              data: importCustomerProvider.customers,
                              callback: () async {
                                await fetchCustomers(context);
                              })
                          : Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(exception.toString(),
                                      textAlign: TextAlign.center),
                                  ElevatedButton(
                                      onPressed: () async {
                                        await fetchCustomers(context);
                                      },
                                      child: const Text('Try Again'))
                                ],
                              ),
                            )
                ].setAllExpanded(),
              )
            : NoInternetStatusText(
                callBack: () async {
                  await fetchCustomers(context);
                },
              ));
  }

  Future<void> fetchCustomers(BuildContext context) async {
    final importCustomerProvider = ImportCustomersProvider.of(context);
    setState(() {
      isLoading = true;
    });

    try {
      await importCustomerProvider.getCustomers();
      exception = null;
    } on AuthException catch (ex) {
      setState(() {
        exception = ex;
      });
    }
    setState(() {
      isLoading = false;
    });
  }
}

class CardItem extends StatelessWidget {
  const CardItem({
    Key? key,
    required this.data,
    required this.callback,
  }) : super(key: key);

  final List<Customer> data;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        data.isNotEmpty
            ? Expanded(
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: ListTile(
                          tileColor: Colors.black12,
                          title: Text(data[index].firstName),
                          subtitle: Text(data[index].lastName),
                        ),
                      ),
                    );
                  },
                ),
              )
            : Container(),
        Center(
          child: ElevatedButton(
              onPressed: callback, child: const Text('Sync Users')),
        )
      ],
    );
  }
}
