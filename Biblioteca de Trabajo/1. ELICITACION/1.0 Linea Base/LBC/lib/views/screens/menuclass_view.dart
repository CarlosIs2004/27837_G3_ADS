import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mingo/views/templates/menuclass_template.dart';

class MenuclassView extends StatefulWidget {
  const MenuclassView({super.key});

  @override
  State<MenuclassView> createState() => _MenuclassViewState();
}

class _MenuclassViewState extends State<MenuclassView> {

  void _goToPrincipiante() {
    context.push('/principiante');
  }
  void _goToIntermedio() {
    context.push('/intermedio');
  }
  void _goToAvanzado() {
    context.push('/avanzado');
  }
  @override
  Widget build(BuildContext context) {
    return MenuclassTemplate( 
      onPrincipianteTap: () => _goToPrincipiante(),
      onIntermedioTap: () => _goToIntermedio(),
      onAvanzadoTap: () => _goToAvanzado(),
    );
  }
}