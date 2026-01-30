import 'package:flutter/material.dart';
import 'package:mingo/presentation/components/organisms/classes/card/menu_class_card.dart';

class MenuClassList extends StatefulWidget {
  final VoidCallback onPrincipianteTap;
  final VoidCallback onIntermedioTap;
  final VoidCallback onAvanzadoTap;
  const MenuClassList({super.key, required this.onPrincipianteTap, required this.onIntermedioTap, required this.onAvanzadoTap});

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
            onTap: widget.onPrincipianteTap,
            icon: Icons.auto_awesome,
            colorsIcon: Colors.blue,
            titleCard: 'Mostrar nivel principiante',
          ),
          const SizedBox(height: 16.0),
          MenuClassCard(
            onTap: widget.onIntermedioTap,
            icon: Icons.trending_up,
            colorsIcon: Colors.orange,
            titleCard: 'Mostrar nivel intermedio',
          ),
          const SizedBox(height: 16.0),
          MenuClassCard(
            onTap:  widget.onAvanzadoTap,
            icon: Icons.emoji_events,
            colorsIcon: Colors.green,
            titleCard: 'Mostrar nivel avanzado',
          ),
        ],
      ),
    );
  }
}
