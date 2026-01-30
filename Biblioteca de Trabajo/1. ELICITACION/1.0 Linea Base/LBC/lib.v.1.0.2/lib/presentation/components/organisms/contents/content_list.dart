import 'package:flutter/material.dart';
import 'package:mingo/data/models/content_model.dart';
import 'package:mingo/presentation/components/organisms/contents/card/content_card.dart';

class ContentList extends StatefulWidget {

  final List<ContentModel> contents;

  const ContentList({super.key, required this.contents});

  @override
  State<ContentList> createState() => _ContentListState();
}

class _ContentListState extends State<ContentList> {

  void _showContentDetail(BuildContext context, ContentModel content) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Permite que el modal crezca según el contenido
      backgroundColor: Colors.transparent, // Para que se vea el redondeado
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Ajusta al tamaño del contenido
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Línea gris de "arrastre" típica de iOS/Android moderno
              Center(
                child: Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Imagen destacada redonda
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    content.url,
                    height: 300,
                    width: 300,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // Título
              Text(
                content.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),

              // Descripción con scroll por si es larga
              Flexible(
                child: SingleChildScrollView(
                  child: Text(
                    content.description,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                      height: 1.5,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Botón de acción (Opcional)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cerrar", style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    if (widget.contents.isEmpty) {
      return const SliverFillRemaining(
        hasScrollBody: false,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.search_off, size: 64, color: Colors.grey),
              SizedBox(height: 16),
              Text(
                'No se encontró contenido disponible',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ],
          ),
        ),
      );
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final content = widget.contents[index];
          return ContentCard(
            onTap: () {
              _showContentDetail(context, content);
            },
            url: content.url,
            titleCard: content.title,
            subtitle: content.description,
          );
        },
        childCount: widget.contents.length,
      )
    );
  }
}
