import 'package:flutter/material.dart';

class ListDownloadContent extends StatefulWidget {
  const ListDownloadContent({super.key});

  @override
  State<ListDownloadContent> createState() => _ListDownloadContentState();
}

class _ListDownloadContentState extends State<ListDownloadContent> {
  // 1. Datos simulados basados en tu imagen
  final List<Map<String, dynamic>> modules = [
    {
      "title": "Fundamentos de la Lengua de señas",
      "description": "Aprende los conceptos básicos de la comunicación en lengua de señas.",
      "tag": "Gratuito",
      "isFree": true,
    },
    {
      "title": "Vocabulario Básico de LSE",
      "description": "Expande tu léxico con palabras y frases comunes en LSE.",
      "tag": "Gratuito",
      "isFree": true,
    },
    {
      "title": "Gramática Avanzada de LSE",
      "description": "Domina las estructuras gramaticales complejas.",
      "tag": "De Pago",
      "isFree": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        title: const Text(
          "Módulos de Aprendizaje",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // 2. Aquí está tu ListView.builder completado
        child: ListView.builder(
          itemCount: modules.length,
          itemBuilder: (context, index) {
            final item = modules[index];
            return _buildModuleCard(item);
          },
        ),
      ),
    );
  }

  // 3. Widget personalizado para diseñar cada tarjeta
  Widget _buildModuleCard(Map<String, dynamic> item) {
    bool isActive = item['isFree']; // Usamos esto para definir el color del borde

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100], // Fondo gris muy claro
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          // Si es "Gratuito" (activo) borde azul, si no, borde transparente o gris
          color: isActive ? Colors.blueAccent : Colors.transparent,
          width: isActive ? 1.5 : 0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Título (ocupa el espacio disponible para no chocar con la etiqueta)
              Expanded(
                child: Text(
                  item['title'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              // Etiqueta (Badge)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: isActive ? Colors.blue[100] : Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    if (!isActive) ...[
                      const Icon(Icons.info_outline, size: 14, color: Colors.black54),
                      const SizedBox(width: 4),
                    ],
                    Text(
                      item['tag'],
                      style: TextStyle(
                        color: isActive ? Colors.blue[700] : Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Descripción
          Text(
            item['description'],
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
              height: 1.3, // Altura de línea para mejor lectura
            ),
          ),
        ],
      ),
    );
  }
}