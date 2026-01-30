import 'package:flutter/material.dart';
import 'package:mingo/core/services/supa_base_service.dart';
import 'package:mingo/presentation/screens/screen_class_link.dart';
import 'package:mingo/presentation/screens/screen_main_teacher.dart';
import 'package:mingo/presentation/templates/login_template.dart';
import 'package:mingo/presentation/viewmodels/user_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {

// Controladores para capturar el texto
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

// Estado para mostrar spinner de carga
  bool _isLoading = false;

  // Función de Login
  Future<void> _signIn() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final AuthResponse res = await SupaBaseService.client.auth.signInWithPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      final User? user = res.user;
      if (user != null) {
        if (mounted) {
          // GUARDAR EN PROVIDER
          context.read<UserViewModel>().setUser(user);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('¡Login exitoso!', textAlign: TextAlign.center,),backgroundColor: Colors.blue,),
          );

          // Redirección según rol
          if(user.userMetadata?['role'] == 'Padre'){
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const ScreenClassLink()),
            );
          } else {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const ScreenMainTeacher()),
            );
          }
        }
      }
    } on AuthException catch (error) {
      // Errores específicos de Supabase (ej: contraseña incorrecta)
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.message),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (error) {
      // Errores generales
      print(error);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Ocurrió un error inesperado', textAlign: TextAlign.center),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoginTemplate(
      emailCtrl: _emailController,
      passCtrl: _passwordController,
      onPressed: ()=> _signIn(),
      isLoading: _isLoading,
    );
  }
}
