import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mingo/viewmodels/login_viewmodel.dart';
import 'package:mingo/views/templates/login_template.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  void loginUserView(LoginViewModel loginVM) async {
    // 1. Validaciones básicas
    if (emailCtrl.text.isEmpty ||
        passCtrl.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Por favor llenar todos los campos")),
      );
      return;
    }

    bool exito = await loginVM.login(
      email: emailCtrl.text,
      password: passCtrl.text
    );
    // 3. Si guardó bien, navegamos
    if (exito && context.mounted) {
      context.go('/classlink');

    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(loginVM.errorMessage))
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<LoginViewModel>(context);
    return LoginTemplate(
      emailCtrl: emailCtrl,
      passCtrl: passCtrl,
      onPressed: ()=> loginUserView(loginViewModel),
    );
  }
}
