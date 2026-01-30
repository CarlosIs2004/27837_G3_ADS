import 'package:flutter/material.dart';
import 'package:mingo/views/components/atoms/custom_button.dart';
import 'package:mingo/views/components/atoms/custom_text.dart';
import 'package:mingo/views/components/atoms/input_field.dart';

class LoginForm extends StatefulWidget {
  final TextEditingController emailCtrl;
  final TextEditingController passCtrl;
  final VoidCallback onPressed;

  const LoginForm({
    super.key,
    required this.onPressed,
    required this.emailCtrl,
    required this.passCtrl,
  });

  @override
  State<LoginForm> createState() => _RegisterFormState();
}


class _RegisterFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Icon(
              Icons.account_circle_outlined,
              color: Color.fromRGBO(8, 153, 253, 1.0),
              size: 80,
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Color.fromRGBO(241, 241, 241, 1.0),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: 'Correo Electrónico', fontSize: 15),
                  InputField(
                    label: 'Ingrese su correo electronico',
                    controller: widget.emailCtrl,
                  ),
                  const SizedBox(height: 10),
                  CustomText(text: 'Contraseña', fontSize: 15),
                  InputField(
                    label: 'Ingrese su contraseña',
                    controller: widget.passCtrl,
                    obscureText: true,
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: CustomButton(
                      text: 'IniciarSesión',
                      onPressed: widget.onPressed,
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      )
    );
  }
}
