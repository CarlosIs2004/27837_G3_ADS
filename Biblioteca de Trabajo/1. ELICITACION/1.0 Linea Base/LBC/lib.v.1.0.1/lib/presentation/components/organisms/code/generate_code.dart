import 'package:flutter/material.dart';

class GenerateCode extends StatefulWidget {

  final String classCode;
  final VoidCallback onShare;

  const GenerateCode({super.key, required this.classCode, required this.onShare});

  @override
  State<GenerateCode> createState() => _GenerateCodeState();
}

class _GenerateCodeState extends State<GenerateCode> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Tarjeta Gris del Código
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            decoration: BoxDecoration(
              color: const Color(0xFFF2F2F2), // Gris claro de la imagen
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: [
                const Text(
                  'Tu código de clase es:',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  widget.classCode,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(8,153,253, 1.0), // Azul brillante del código
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 25),
                const Text(
                  'Comparte este código con los padres para que puedan unirse a tu clase y seguir el progreso de sus hijos.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // Botón de Compartir
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton.icon(
              onPressed: widget.onShare,
              icon: const Icon(Icons.share_outlined, color: Colors.white),
              label: const Text(
                'Compartir Código',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(8,153,253, 1.0), // Azul del botón
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
