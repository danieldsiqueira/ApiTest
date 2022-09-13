import 'package:flutter/cupertino.dart';
import 'package:teste_01/authentication/ui/login_view/login_view.dart';
import 'package:teste_01/ui/home_view/home_view.dart';

Map<String, Widget Function(BuildContext)> getRoutes() {
  return {
    LoginView.route: (_) => const LoginView(),
    HomeView.route: (_) => const HomeView(),
  };
}
