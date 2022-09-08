import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:teste_01/authentication/models/user.dart';
import 'package:teste_01/ui/home_view/home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    final vm = GetIt.I.get<HomeViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Teste')),
      body: Observer(builder: (context) {
        return FutureBuilder<List<User>>(
          future: vm.listUsers,
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
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
                        child: const Text('Sync Users'))
                  ],
                ),
              );
            }
            return Center(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(snapshot.data![index].firstName),
                        );
                      },
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        await vm.importUsers();
                      },
                      child: const Text('Sync Users'))
                ],
              ),
            );
          }),
        );
      }),
    );
  }
}
