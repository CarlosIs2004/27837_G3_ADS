import 'package:flutter/material.dart';

class MenuClassCard extends StatefulWidget {

  final VoidCallback onTap;
  final String titleCard;
  final String subtitleCard;

  const MenuClassCard({super.key, required this.onTap, required this.titleCard, required this.subtitleCard});

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
        leading: Icon(Icons.class_outlined, color: Colors.black,),
        title: Text(widget.titleCard, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
        subtitle: Text(widget.subtitleCard),
        onTap: widget.onTap
      ),
    );
  }
}
