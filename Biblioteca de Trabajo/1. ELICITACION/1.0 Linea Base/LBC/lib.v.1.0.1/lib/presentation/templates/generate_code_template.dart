import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mingo/presentation/viewmodels/code_viewmodel.dart';
import 'package:mingo/presentation/components/organisms/code/generate_code.dart';
import 'package:mingo/presentation/components/organisms/toll_bar.dart';
import 'package:share_plus/share_plus.dart';

class GenerateCodeTemplate extends StatefulWidget {
  const GenerateCodeTemplate({super.key});

  @override
  State<GenerateCodeTemplate> createState() => _GenerateCodeTemplateState();
}

class _GenerateCodeTemplateState extends State<GenerateCodeTemplate> {

  @override
  void initState() {
    super.initState();
    // Generamos el código al iniciar la pantalla
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CodeViewModel>().generateNewCodeLocally();
    });
  }

  Future<void> _share(String code) async {
    await Share.share(
      '¡Únete a mi clase en Mingo! 🎓\nEl código de acceso es: $code',
      subject: 'Código de Clase Mingo',
    );
  }

  @override
  Widget build(BuildContext context) {
    final codeVM = context.watch<CodeViewModel>();

    return Scaffold(
      backgroundColor: const Color.fromRGBO(192, 223, 254, 1.0),
      appBar: AppBar(
        title: const TollBar(titlePage: 'Código de Clase', reverse: true),
      ),
      body: Center(
        child: codeVM.currentCode == null
            ? const CircularProgressIndicator()
            : GenerateCode(
          classCode: codeVM.currentCode!,
          onShare: () async {
            // Si ya está registrado, solo comparte
            if (codeVM.isCodeRegistered) {
              _share(codeVM.currentCode!);
              return;
            }

            // Si no, lo registra primero
            bool success = await codeVM.registerCurrentCode();

            if (success && mounted) {
              _share(codeVM.currentCode!);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('¡Clase creada y lista para compartir!'),
                  backgroundColor: Colors.blue,
                ),
              );
            } else if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Error al registrar el código'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}