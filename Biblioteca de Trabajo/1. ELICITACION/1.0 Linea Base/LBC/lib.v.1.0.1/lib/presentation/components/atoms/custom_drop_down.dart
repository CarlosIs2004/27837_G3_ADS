import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  final List<String> items;
  final String? value;
  final String hint;
  final Function(String?) onChanged;

  const CustomDropDown({
    super.key,
    required this.items,
    required this.onChanged,
    this.value,
    this.hint = 'Selecciona una opción',
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
      hint: Text(hint, style: const TextStyle(color: Colors.grey, fontSize: 14)),

      // Aquí aplicamos el estilo gris de tu imagen original
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFF3F4F6),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide.none,
        ),
      ),

      // Mapeamos tu lista de Strings a DropdownMenuItem
      items: items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item, style: const TextStyle(fontSize: 14)),
        );
      }).toList(),

      onChanged: onChanged,
    );
  }
}