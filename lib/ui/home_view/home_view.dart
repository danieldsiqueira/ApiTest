import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'package:teste_01/authentication/models/customer.dart';
import 'package:teste_01/authentication/models/logged_user.dart';
import 'package:teste_01/common/controllers/connection_controller.dart';
import 'package:teste_01/common/widgets/no_internet_text.dart';
import 'package:teste_01/ui/home_view/home_view_controller.dart';

class HomeView extends StatefulWidget {
  static const route = 'homeView';

  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final connectionController = GetIt.I.get<ConnectionController>();
    final sessionStore = GetIt.I.get<LoggedUser>();

    return Provider(
        create: (context) => HomeViewController(GetIt.I.get()),
        builder: (context, snapshot) {
          return Consumer<HomeViewController>(builder: (context, vm, _) {
            return Scaffold(
                appBar: AppBar(title: Text(sessionStore.user.email)),
                body: Observer(builder: (context) {
                  return connectionController.haveInternet
                      ? FutureBuilder<List<Customer>>(
                          future: vm.customers,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            if (snapshot.hasError) {
                              vm.getCustomers;
                              return ErrorWidget(
                                  exception: snapshot.error as Exception,
                                  callBack: () {
                                    vm.getCustomers();
                                  });
                            }
                            return ListOfItems(
                                data: snapshot.data!,
                                callback: () {
                                  vm.getCustomers();
                                });
                          })
                      : NoInternetStatusText(
                          callBack: () async {},
                        );
                }));
          });
        });
  }
}

class ErrorWidget extends StatelessWidget {
  final Exception exception;
  final VoidCallback callBack;
  const ErrorWidget({Key? key, required this.exception, required this.callBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(exception.toString(), textAlign: TextAlign.center),
            ElevatedButton(
              onPressed: callBack,
              child: const Text('Try Again'),
            )
          ]),
    );
  }
}

class ListOfItems extends StatelessWidget {
  const ListOfItems({
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
