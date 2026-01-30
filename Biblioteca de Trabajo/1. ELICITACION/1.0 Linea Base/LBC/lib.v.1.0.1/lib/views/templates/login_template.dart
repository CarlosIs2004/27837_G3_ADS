import 'package:flutter/material.dart';
import 'package:mingo/views/components/molecules/tollbar.dart';
import 'package:mingo/views/components/organisms/login_form.dart';

class LoginTemplate extends StatelessWidget {
  final TextEditingController emailCtrl;
  final TextEditingController passCtrl;
  final VoidCallback onPressed;

  const LoginTemplate({super.key,
  required this.emailCtrl,
  required this.passCtrl,
  required this.onPressed

  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(220,231,251,1.0),
      appBar: Tollbar(titlePage:'Iniciar Sesión', isLogin: true,),
      body: Center(child: LoginForm( onPressed: onPressed, emailCtrl: emailCtrl, passCtrl: passCtrl)),
    );
  }
}