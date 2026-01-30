import 'package:flutter/material.dart';

class DropDownInputCustom extends StatefulWidget {
  final String label;
  final List<String> items;
  final String? value;
  final Function(String?) onChanged;


  const DropDownInputCustom({super.key, required this.label, required this.items, this.value, required this.onChanged});

  @override
  State<DropDownInputCustom> createState() => _DropDownInputCustomState();
}

class _DropDownInputCustomState extends State<DropDownInputCustom> {
  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        hintText: widget.label,
        border: OutlineInputBorder(),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: widget.value,
          hint: Text("Seleccione una opción"),
          isExpanded: true,
          onChanged: widget.onChanged,
          items: widget.items
              .map((item) => DropdownMenuItem(
            value: item,
            child: Text(item),
          ))
              .toList(),
        ),
      ),
    );
  }
}

