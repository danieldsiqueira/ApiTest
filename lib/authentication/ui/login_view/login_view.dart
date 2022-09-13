import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:teste_01/authentication/ui/login_view/login_view_model.dart';
import 'package:teste_01/common/widgets/custom_text_form_field.dart';

class LoginView extends StatelessWidget {
  static const route = 'loginView';
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = GetIt.I.get<LoginViewModel>();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black54),
              ),
              child: Observer(builder: (context) {
                return Column(mainAxisSize: MainAxisSize.min, children: [
                  const Text(
                    'Login to your account',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextFormField(
                    labelText: 'Email',
                    onChanged: (value) => vm.email = value,
                    errorText: vm.errorEmailMessage(),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    onChanged: (value) => vm.senha = value,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: 'Senha',
                        errorText: vm.errorPasswordMessage()),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(onPressed: () {}, child: const Text('Login'))
                ]);
              })),
        ),
      ),
    );
  }
}
