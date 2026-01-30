import 'package:flutter/material.dart';
import 'package:mingo/presentation/components/organisms/optionsclass/card/menu_class_card.dart';

class MenuClassList extends StatefulWidget {
  final VoidCallback viewProgress;
  final VoidCallback importContent;
  final VoidCallback generateCode;
  const MenuClassList({super.key, required this.viewProgress, required this.importContent, required this.generateCode});

  @override
  State<MenuClassList> createState() => _MenuClassListState();
}

class _MenuClassListState extends State<MenuClassList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MenuClassCard(
            onTap: widget.viewProgress,
            icon: Icons.bar_chart_rounded,
            colorsIcon: Colors.blue,
            titleCard: 'Visualizar Progreso',
          ),
          const SizedBox(height: 16.0),
          MenuClassCard(
            onTap: widget.importContent,
            icon: Icons.cloud_upload_outlined,
            colorsIcon: Colors.blue,
            titleCard: 'Importar Contenido',
          ),
          const SizedBox(height: 16.0),
          MenuClassCard(
            onTap:  widget.generateCode,
            icon: Icons.qr_code,
            colorsIcon: Colors.blue,
            titleCard: 'Generar Código de Clase',
          ),
        ],
      ),
    );
  }
}
