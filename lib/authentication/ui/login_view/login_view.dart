import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:teste_01/authentication/ui/login_view/login_view_controller.dart';
import 'package:teste_01/common/widgets/custom_text_form_field.dart';

class LoginView extends StatefulWidget {
  static const route = 'loginView';
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (context) => GetIt.I.get<LoginViewController>(),
        builder: (context, snapshot) {
          return Consumer<LoginViewController>(builder: (context, vm, _) {
            return Scaffold(body: SafeArea(
              child: Center(
                child: Observer(builder: (context) {
                  return AnimatedContainer(
                      curve: Curves.easeInOutExpo,
                      duration: const Duration(milliseconds: 500),
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      padding: const EdgeInsets.all(16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black54),
                      ),
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        const Text(
                          'Login to your account',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomTextFormField(
                          labelText: 'Email',
                          onChanged: (value) => vm.email = value,
                          errorText: vm.errorEmailMessage,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomTextFormField(
                          onChanged: (value) => vm.password = value,
                          obscureText: true,
                          labelText: 'Senha',
                          errorText: vm.errorPasswordMessage,
                        ),
                        AnimatedCrossFade(
                          duration: const Duration(milliseconds: 300),
                          firstCurve: Curves.easeInOutExpo,
                          crossFadeState: vm.isSignUp
                              ? CrossFadeState.showFirst
                              : CrossFadeState.showSecond,
                          secondChild: Container(),
                          firstChild: Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: CustomTextFormField(
                              onChanged: (value) => vm.confirmPassword = value,
                              obscureText: true,
                              labelText: 'Confirmar Senha',
                              errorText: vm.errorConfirmPassword,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                vm.toggleSignUp();
                              },
                              child: const Text('SignUp'),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text('Login'),
                            ),
                          ],
                        )
                      ]));
                }),
              ),
            ));
          });
        });
  }
}
