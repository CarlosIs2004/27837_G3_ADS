import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mingo/views/components/molecules/selectablecard.dart';

class MenucardList extends StatefulWidget {
  final VoidCallback onPrincipianteTap;
  final VoidCallback onIntermedioTap;
  final VoidCallback onAvanzadoTap;
  const MenucardList({super.key
    , required this.onPrincipianteTap
    , required this.onIntermedioTap
    , required this.onAvanzadoTap
    });

  @override
  State<MenucardList> createState() => _MenucardListState();
}

class _MenucardListState extends State<MenucardList> {
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Selectablecard(
            onTap: widget.onPrincipianteTap,
            icon: Icons.auto_awesome,
            colorsIcon: Colors.blue,
            titleCard: 'Mostrar nivel principiante',
          ),
          const SizedBox(height: 16.0),
          Selectablecard(
            onTap: widget.onIntermedioTap,
            icon: Icons.trending_up,
            colorsIcon: Colors.orange,
            titleCard: 'Mostrar nivel intermedio',
          ),
          const SizedBox(height: 16.0),
          Selectablecard(
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
