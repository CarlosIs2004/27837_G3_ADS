import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          // Definición de colores
          backgroundColor: const Color.fromRGBO(8, 153, 253, 1.0),
          foregroundColor: Colors.white, 
          // Ajustamos el padding (lo puedes reducir si usas width: infinity)
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
          
          // Opcional: Define la forma (bordes redondeados)
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
      ),
      child: Text(text),
    );
  }
}
