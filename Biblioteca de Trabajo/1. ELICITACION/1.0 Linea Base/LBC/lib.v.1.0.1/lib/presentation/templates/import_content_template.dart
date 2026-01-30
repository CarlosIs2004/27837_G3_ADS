import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mingo/presentation/components/organisms/contents/import/import_content.dart';
import 'package:mingo/presentation/components/organisms/toll_bar.dart';

class ImportContentTemplate extends StatelessWidget {
  final TextEditingController phraseController;
  final TextEditingController titleController;
  final TextEditingController associatedPhrasesController;
  final TextEditingController keywordsController;
  final VoidCallback onImport;
  final VoidCallback onPickVideo;
  final VoidCallback onPickImage;
  final File? videoFile;
  final File? imageFile;
  final Function(int?) onCategoryChanged;
  final Function(int?) onLevelChanged;
  final int? selectedCategory;
  final int? selectedLevel;

  const ImportContentTemplate({
    super.key,
    required this.phraseController,
    required this.titleController,
    required this.associatedPhrasesController,
    required this.keywordsController,
    required this.onImport,
    required this.onPickVideo,
    required this.onPickImage,
    this.videoFile,
    this.imageFile,
    required this.onCategoryChanged,
    required this.onLevelChanged,
    this.selectedCategory,
    this.selectedLevel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TollBar(titlePage: 'Importar Contenido', reverse: true),
      ),
      body: ImportContent(
        phraseController: phraseController,
        titleController: titleController,
        associatedPhrasesController: associatedPhrasesController,
        keywordsController: keywordsController,
        onImport: onImport,
        onPickVideo: onPickVideo,
        onPickImage: onPickImage,
        isVideoSelected: videoFile != null,
        isImageSelected: imageFile != null,
        onCategoryChanged: onCategoryChanged,
        onLevelChanged: onLevelChanged,
        selectedCategory: selectedCategory,
        selectedLevel: selectedLevel,
      ),
    );
  }
}