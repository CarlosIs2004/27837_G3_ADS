import 'package:flutter/material.dart';
import 'package:mingo/presentation/components/organisms/login/login_form.dart';
import 'package:mingo/presentation/components/organisms/toll_bar.dart';

class LoginTemplate extends StatefulWidget {

  final TextEditingController emailCtrl;
  final TextEditingController passCtrl;
  final VoidCallback onPressed;
  final bool isLoading;

  const LoginTemplate({super.key, required this.emailCtrl, required this.passCtrl, required this.onPressed, required this.isLoading});

  @override
  State<LoginTemplate> createState() => _LoginTemplateState();
}

class _LoginTemplateState extends State<LoginTemplate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(192, 223, 254, 1.0),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TollBar(titlePage: 'Iniciar Sesión', isLogin: true),
      ),
      body: Center(child: LoginForm( onPressed: widget.onPressed, emailCtrl: widget.emailCtrl, passCtrl: widget.passCtrl, isLoading: widget.isLoading,)),
    );
  }
}
