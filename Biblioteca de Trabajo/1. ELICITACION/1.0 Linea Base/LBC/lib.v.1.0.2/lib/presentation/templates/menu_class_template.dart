import 'package:flutter/material.dart';
import 'package:mingo/presentation/components/organisms/classes/menu_class_list.dart';
import 'package:mingo/presentation/components/organisms/toll_bar.dart';

class MenuClassTemplate extends StatefulWidget {

  final VoidCallback onPrincipianteTap;
  final VoidCallback onIntermedioTap;
  final VoidCallback onAvanzadoTap;

  const MenuClassTemplate({super.key, required this.onPrincipianteTap, required this.onIntermedioTap, required this.onAvanzadoTap});

  @override
  State<MenuClassTemplate> createState() => _MenuClassTemplateState();
}

class _MenuClassTemplateState extends State<MenuClassTemplate> {
  @override
  void initState() {
    super.initState();
    // Cerramos cualquier teclado residual del login al iniciar esta pantalla
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).unfocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Evita que el teclado deforme el diseño al entrar
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(192, 223, 254, 1.0),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const TollBar(titlePage: 'Menú de Clases', reverse: true),
      ),
      body: Center( // Centrado horizontal
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(), // Efecto de rebote agradable
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: MenuClassList(
              onPrincipianteTap: widget.onPrincipianteTap,
              onIntermedioTap: widget.onIntermedioTap,
              onAvanzadoTap: widget.onAvanzadoTap,
            ),
          ),
        ),
      ),
    );
  }
}