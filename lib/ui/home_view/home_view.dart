import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:teste_01/authentication/infra/data/customer_repository.dart';
import 'package:teste_01/authentication/models/customer.dart';
import 'package:teste_01/common/providers/connection_provider.dart';
import 'package:teste_01/common/widgets/no_internet_text.dart';

class HomeView extends StatefulWidget {
  static const route = 'homeView';

  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final repository = CustomerRepository();
  late Future<List<Customer>> customers;

  @override
  void initState() {
    super.initState();
    log('calling init state');
    _getData();
  }

  Future<List<Customer>> _getData() async {
    return customers = repository.getCustomers();
  }

  final connectionProvider = ConnectionProvider();
  @override
  Widget build(BuildContext context) {
    final hasConnectionToInternet = ConnectionProviderInherited.of(context);

    return Scaffold(
        appBar: AppBar(title: const Text('Teste')),
        body: hasConnectionToInternet
            ? FutureBuilder<List<Customer>>(
                future: customers,
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(snapshot.error.toString(),
                              textAlign: TextAlign.center),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _getData();
                                });
                              },
                              child: const Text('Try Again'))
                        ],
                      ),
                    );
                  }

                  return CardItem(
                    callback: () {
                      setState(() {
                        _getData();
                      });
                    },
                    data: snapshot.data!,
                  );
                }),
              )
            : NoInternetStatusText(
                callBack: () {
                  setState(() {
                    _getData();
                  });
                },
              ));
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
