import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mingo/models/user.dart';
import 'package:mingo/viewmodels/register_viewmodel.dart';
import 'package:mingo/views/screens/classlink_view.dart';
import 'package:mingo/views/templates/register_template.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final nombreCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final dateCtrl = TextEditingController();
  List<String> items = ["Padre", "Docente"];
  String? rolSeleccionado;

  void registerUserView(RegisterViewModel viewModel) async {
    // 1. Validaciones básicas
    if (nombreCtrl.text.isEmpty ||
        emailCtrl.text.isEmpty ||
        rolSeleccionado == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Por favor llena todos los campos")),
      );
      return;
    }

    bool exito = await viewModel.register(
      name: nombreCtrl.text,
      email: emailCtrl.text,
      password: passCtrl.text,
      dateText: dateCtrl.text,
      role: rolSeleccionado!,
    );
    // 3. Si guardó bien, navegamos
    if (exito && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("¡Usuario registrado con éxito!"))
      );
      context.go('/login');
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Hubo un error al registrar"))
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final registerViewModel = Provider.of<RegisterViewModel>(context);
    return RegisterTemplate(
      nombreCtrl: nombreCtrl,
      emailCtrl: emailCtrl,
      passCtrl: passCtrl,
      dateCtrl: dateCtrl,
      items: items,
      onChanged: (value) {
        setState(() {
          rolSeleccionado = value;
        });
      },
      onPressed: () => registerUserView(registerViewModel),
      value: rolSeleccionado,
      showBackButton: true,
    );
  }
}
