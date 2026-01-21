import 'package:flutter/material.dart';

class Selectablecard extends StatelessWidget {
  final VoidCallback onTap;
  final Color colorsIcon;
  final IconData icon;
  final String titleCard;

  const Selectablecard({
    super.key,
    required this.onTap,
    required this.colorsIcon,
    required this.icon,
    required this.titleCard,});

  @override
  Widget build(BuildContext context) {
    return Card(
                elevation: 4,
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 16.0),
                  leading: Icon(icon, color: colorsIcon),
                  title: Text(titleCard),
                  onTap: onTap
                ),
              );
  }
}
