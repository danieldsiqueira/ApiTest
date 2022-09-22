import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:teste_01/authentication/errors/auth_exception.dart';
import 'package:teste_01/authentication/ui/login_view/login_view_controller.dart';
import 'package:teste_01/common/widgets/custom_text_form_field.dart';
import 'package:teste_01/ui/home_view/home_view.dart';

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
                        const _AnimatedCrossFadeConfirmPassword(),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            _AnimatedCrossFadeElevatedButton(
                                isSignUpButton: true),
                            SizedBox(
                              width: 16,
                            ),
                            _AnimatedCrossFadeElevatedButton(
                                isSignUpButton: false),
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

class _AnimatedCrossFadeConfirmPassword extends StatelessWidget {
  const _AnimatedCrossFadeConfirmPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<LoginViewController>(context);

    return Observer(builder: (context) {
      return AnimatedCrossFade(
        duration: const Duration(milliseconds: 300),
        firstCurve: Curves.easeInOutExpo,
        crossFadeState:
            vm.isSignUp ? CrossFadeState.showFirst : CrossFadeState.showSecond,
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
      );
    });
  }
}

class _AnimatedCrossFadeElevatedButton extends StatelessWidget {
  final bool isSignUpButton;

  const _AnimatedCrossFadeElevatedButton({
    required this.isSignUpButton,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<LoginViewController>(context, listen: false);

    return Observer(builder: (context) {
      return AnimatedCrossFade(
        duration: const Duration(milliseconds: 300),
        firstCurve: Curves.easeInOutExpo,
        crossFadeState:
            vm.isSignUp ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        firstChild: isSignUpButton
            ? OutlinedButton(
                onPressed: () {
                  vm.toggleSignUp();
                },
                child: const SizedBox(
                    width: 80,
                    child: Center(
                      child: Text('Login'),
                    )),
              )
            : ElevatedButton(
                onPressed: () => _tryAuthFunction(context, signUp: true),
                child: const SizedBox(
                    width: 80,
                    child: Center(
                      child: Text('Register'),
                    )),
              ),
        secondChild: isSignUpButton
            ? OutlinedButton(
                onPressed: () {
                  vm.toggleSignUp();
                },
                child: const SizedBox(
                    width: 80,
                    child: Center(
                      child: Text('SignUp'),
                    )),
              )
            : ElevatedButton(
                onPressed: () => _tryAuthFunction(context, signUp: false),
                child: const SizedBox(
                    width: 80,
                    child: Center(
                      child: Text('Login'),
                    )),
              ),
      );
    });
  }

  void _tryAuthFunction(BuildContext context, {required bool signUp}) {
    final vm = Provider.of<LoginViewController>(context, listen: false);
    try {
      signUp ? vm.signUser() : vm.loginUser();
      Navigator.of(context).pushReplacementNamed(HomeView.route);
    } on AuthException catch (ex) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Error'),
                content: Text(ex.toString()),
              ));
    }
  }
}
