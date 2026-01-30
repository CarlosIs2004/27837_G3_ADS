import 'package:flutter/material.dart';
import 'package:mingo/views/components/atoms/custom_text.dart';
import 'package:mingo/views/components/molecules/tollbar.dart';
import 'package:mingo/views/components/organisms/register_form.dart';

class RegisterTemplate extends StatelessWidget {
  final TextEditingController nombreCtrl;
  final TextEditingController emailCtrl;
  final TextEditingController passCtrl;
  final TextEditingController dateCtrl;
  final List<String> items;
  final String? value;
  final Function(String?) onChanged;
  final VoidCallback onPressed;
  final bool showBackButton;

  const RegisterTemplate({
    super.key,
    required this.nombreCtrl,
    required this.emailCtrl,
    required this.passCtrl,
    required this.dateCtrl,
    required this.items,
    this.value,
    required this.onChanged,
    required this.onPressed,
    required this.showBackButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(220, 231, 251, 1.0),
      appBar: Tollbar(titlePage: 'Registrarse', showBackButton: showBackButton),
      body: Center(
        child: RegisterForm(
          items: items,
          onChanged: onChanged,
          onPressed: onPressed,
          nombreCtrl: nombreCtrl,
          emailCtrl: emailCtrl,
          passCtrl: passCtrl,
          dateCtrl: dateCtrl,
          value: value,
        ),
      ),
    );
  }
}
