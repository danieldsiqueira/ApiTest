import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:teste_01/authentication/models/user.dart';
import 'package:teste_01/common/connection_store.dart';
import 'package:teste_01/common/widgets/no_internet_text.dart';
import 'package:teste_01/ui/home_view/home_view_model.dart';

class HomeView extends StatefulWidget {
  static const route = 'homeView';

  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    var vm = GetIt.I.get<HomeViewModel>();
    vm.importUsers();
  }

  @override
  Widget build(BuildContext context) {
    final vm = GetIt.I.get<HomeViewModel>();
    final connection = GetIt.I.get<ConnectionStore>();

    return Scaffold(
      appBar: AppBar(title: const Text('Teste')),
      body: Observer(builder: (context) {
        return connection.haveInternet
            ? FutureBuilder<List<User>>(
                future: vm.listUsers,
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
                              onPressed: () async {
                                await vm.importUsers();
                              },
                              child: const Text('Try Again'))
                        ],
                      ),
                    );
                  }

                  return CardItem(
                    vm: vm,
                    data: snapshot.data!,
                  );
                }),
              )
            : NoInternetStatusText(
                callBack: vm.importUsers,
              );
      }),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({Key? key, required this.vm, required, required this.data})
      : super(key: key);

  final HomeViewModel vm;
  final List<User> data;

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
              onPressed: () async {
                await vm.importUsers();
              },
              child: const Text('Sync Users')),
        )
      ],
    );
  }
}
