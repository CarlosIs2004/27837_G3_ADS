import 'package:flutter/material.dart';
import 'package:mingo/presentation/components/organisms/register/register_form.dart';
import 'package:mingo/presentation/components/organisms/toll_bar.dart';

class RegisterTemplate extends StatefulWidget {

  final TextEditingController nombreCtrl;
  final TextEditingController emailCtrl;
  final TextEditingController passCtrl;
  final TextEditingController dateCtrl;
  final List<String> items;
  final String? value;
  final Function(String?) onChanged;
  final VoidCallback onPressed;
  final bool showBackButton;

  const RegisterTemplate({super.key, required this.nombreCtrl, required this.emailCtrl, required this.passCtrl, required this.dateCtrl, required this.items, this.value, required this.onChanged, required this.onPressed, required this.showBackButton});

  @override
  State<RegisterTemplate> createState() => _RegisterTemplateState();
}

class _RegisterTemplateState extends State<RegisterTemplate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(220, 231, 251, 1.0),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TollBar(titlePage: 'Registrarse', showBackButton: widget.showBackButton),
      ),
      body: Center(
        child: RegisterForm(
          items: widget.items,
          onChanged: widget.onChanged,
          onPressed: widget.onPressed,
          nombreCtrl: widget.nombreCtrl,
          emailCtrl: widget.emailCtrl,
          passCtrl: widget.passCtrl,
          dateCtrl: widget.dateCtrl,
          value: widget.value,
        ),
      ),
    );
  }
}
