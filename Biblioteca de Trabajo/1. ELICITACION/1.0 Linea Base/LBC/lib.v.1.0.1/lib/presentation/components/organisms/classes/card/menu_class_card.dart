import 'package:flutter/material.dart';

class MenuClassCard extends StatefulWidget {

  final VoidCallback onTap;
  final Color colorsIcon;
  final IconData icon;
  final String titleCard;

  const MenuClassCard({super.key, required this.onTap, required this.colorsIcon, required this.icon, required this.titleCard});

  @override
  State<MenuClassCard> createState() => _MenuClassCardState();
}

class _MenuClassCardState extends State<MenuClassCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 16.0),
        leading: Icon(widget.icon, color: widget.colorsIcon),
        title: Text(widget.titleCard),
        onTap: widget.onTap
      ),
    );
  }
}
