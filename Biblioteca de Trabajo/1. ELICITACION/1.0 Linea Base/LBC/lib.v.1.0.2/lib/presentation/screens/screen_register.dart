import 'package:flutter/material.dart';
import 'package:mingo/core/services/supa_base_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:mingo/presentation/templates/register_template.dart';

class ScreenRegister extends StatefulWidget {
  const ScreenRegister({super.key});

  @override
  State<ScreenRegister> createState() => _ScreenRegisterState();
}

class _ScreenRegisterState extends State<ScreenRegister> {

  final nombreCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final dateCtrl = TextEditingController();

  List<String> items = ["Padre", "Docente"];
  String? rolSeleccionado;

  bool _isLoading = false;

  Future<void> _signUp() async {
    if (emailCtrl.text.isEmpty || passCtrl.text.isEmpty || rolSeleccionado == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, rellena todos los campos')),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final AuthResponse res = await SupaBaseService.client.auth.signUp(
        email: emailCtrl.text.trim(),
        password: passCtrl.text.trim(),
        // 3. Pasamos los datos adicionales (Metadata)
        data: {
          'full_name': nombreCtrl.text.trim(),
          'birthday': dateCtrl.text,
          'role': rolSeleccionado,
        },
      );

      final Session? session = res.session;
      final User? user = res.user;

      if (mounted) {
        if (user != null && session == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('¡Cuenta creada! Revisa tu email para confirmar.'),
              backgroundColor: Colors.blue,
            ),
          );
          Navigator.pop(context);
        } else if (session != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('¡Bienvenido! Registro exitoso.')),
          );
        }
      }
    } on AuthException catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.message), backgroundColor: Colors.red),
        );
      }
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error inesperado'), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  void dispose() {
    // Siempre limpia los controladores
    nombreCtrl.dispose();
    emailCtrl.dispose();
    passCtrl.dispose();
    dateCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
      onPressed: _signUp,
      value: rolSeleccionado,
      showBackButton: true,
    );
  }
}