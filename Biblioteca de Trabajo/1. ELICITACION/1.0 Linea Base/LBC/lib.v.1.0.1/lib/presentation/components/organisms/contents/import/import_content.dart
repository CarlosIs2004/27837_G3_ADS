import 'package:flutter/material.dart';
import 'package:mingo/presentation/components/atoms/custom_button.dart';
import 'package:mingo/presentation/components/atoms/custom_text.dart';
import 'package:mingo/presentation/components/atoms/input_field.dart';

class ImportContent extends StatelessWidget {
  final TextEditingController phraseController;
  final TextEditingController titleController;
  final TextEditingController associatedPhrasesController;
  final TextEditingController keywordsController;
  final VoidCallback onImport;
  final VoidCallback onPickVideo;
  final VoidCallback onPickImage;
  final bool isVideoSelected;
  final bool isImageSelected;
  final Function(int?) onCategoryChanged;
  final Function(int?) onLevelChanged;
  final int? selectedCategory;
  final int? selectedLevel;

  const ImportContent({
    super.key,
    required this.phraseController,
    required this.titleController,
    required this.associatedPhrasesController,
    required this.keywordsController,
    required this.onImport,
    required this.onPickVideo,
    required this.onPickImage,
    required this.isVideoSelected,
    required this.isImageSelected,
    required this.onCategoryChanged,
    required this.onLevelChanged,
    this.selectedCategory,
    this.selectedLevel,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            color: const Color.fromRGBO(241, 241, 241, 1),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: 'Archivos Multimedia', fontSize: 15),
                  const SizedBox(height: 16),
                  _buildFileButton(
                    onPressed: onPickVideo,
                    isSelected: isVideoSelected,
                    label: isVideoSelected ? 'Video Seleccionado' : 'Subir Video',
                    icon: Icons.video_call_outlined,
                  ),
                  const SizedBox(height: 8),
                  _buildFileButton(
                    onPressed: onPickImage,
                    isSelected: isImageSelected,
                    label: isImageSelected ? 'Imagen Seleccionada' : 'Subir Imagen',
                    icon: Icons.image,
                  ),
                  const SizedBox(height: 16),
                  CustomText(text: 'Frase Asociada', fontSize: 13),
                  InputField(label: 'Frase de la seña', controller: phraseController),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            color: const Color.fromRGBO(241, 241, 241, 1),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: 'Detalles del Contenido', fontSize: 15),
                  const SizedBox(height: 16),
                  InputField(label: 'Título del contenido', controller: titleController),
                  const SizedBox(height: 16),
                  _buildDropdown(
                    label: 'Categoría',
                    value: selectedCategory,
                    items: ['Saludos', 'Animales', 'Frutas'],
                    onChanged: onCategoryChanged,
                  ),
                  const SizedBox(height: 16),
                  _buildDropdown(
                    label: 'Nivel Educativo',
                    value: selectedLevel,
                    items: ['Principiante', 'Intermedio', 'Avanzado'],
                    onChanged: onLevelChanged,
                  ),
                  const SizedBox(height: 16),
                  InputField(label: 'Frases adicionales (comas)', controller: associatedPhrasesController),
                  const SizedBox(height: 16),
                  InputField(label: 'Palabras clave (comas)', controller: keywordsController),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          CustomButton(text: 'Importar Contenido', onPressed: onImport),
        ],
      ),
    );
  }

  Widget _buildFileButton({required VoidCallback onPressed, required bool isSelected, required String label, required IconData icon}) {
    final color = isSelected ? Colors.green : const Color.fromRGBO(8, 153, 253, 1.0);
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: TextButton.icon(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: color.withOpacity(0.1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
        icon: Icon(isSelected ? Icons.check_circle : icon, color: color, size: 28),
        label: Text(label, style: TextStyle(color: color, fontWeight: FontWeight.w500)),
      ),
    );
  }

  Widget _buildDropdown({required String label, required int? value, required List<String> items, required Function(int?) onChanged}) {
    return DropdownButtonFormField<int>(
      value: value,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      ),
      items: items.asMap().entries.map((e) => DropdownMenuItem<int>(value: e.key + 1, child: Text(e.value))).toList(),
    );
  }
}