import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mingo/presentation/viewmodels/content_advanced_viewmodel.dart';
import 'package:mingo/presentation/viewmodels/content_beginner_viewmodel.dart';
import 'package:mingo/presentation/viewmodels/content_intermediate_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:mingo/presentation/templates/import_content_template.dart';
// Importa tus ViewModels aquí

class ScreenImportContent extends StatefulWidget {
  const ScreenImportContent({super.key});

  @override
  State<ScreenImportContent> createState() => _ScreenImportContentState();
}

class _ScreenImportContentState extends State<ScreenImportContent> {
  final _phraseController = TextEditingController();
  final _titleController = TextEditingController();
  final _associatedPhrasesController = TextEditingController();
  final _keywordsController = TextEditingController();

  int? _selectedCategory;
  int? _selectedLevel;
  File? _videoFile;
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickVideo() async {
    final XFile? picked = await _picker.pickVideo(source: ImageSource.gallery);
    if (picked != null) setState(() => _videoFile = File(picked.path));
  }

  Future<void> _pickImage() async {
    final XFile? picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) setState(() => _imageFile = File(picked.path));
  }

  void _importContent() async {
    if (_selectedLevel == null || _selectedCategory == null || _imageFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Completa los campos y sube un video')));
      return;
    }

    showDialog(context: context, barrierDismissible: false, builder: (c) => const Center(child: CircularProgressIndicator()));

    try {
      final title = _titleController.text;
      final desc = '${_phraseController.text} - ${_associatedPhrasesController.text} - ${_keywordsController.text}';
      final cat = _selectedCategory!;
      final file = _imageFile!;

      switch (_selectedLevel) {
        case 1:
          await context.read<ContentBeginnerViewModel>().uploadContentBeginner(title: title, description: desc, idCategory: cat, idLevel: 1, imageFile: file);
          break;
        case 2:
          await context.read<ContentIntermediateViewmodel>().uploadContentIntermediate(title: title, description: desc, idCategory: cat, idLevel: 2, imageFile: file);
          break;
        case 3:
          await context.read<ContentAdvancedViewmodel>().uploadContentAdvanced(title: title, description: desc, idCategory: cat, idLevel: 3, imageFile: file);
          break;
      }

      if (mounted) {
        Navigator.pop(context); // Cierra loading
        Navigator.pop(context); // Vuelve al menú
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('¡Contenido subido con éxito!', textAlign: TextAlign.center,), backgroundColor: Colors.green));
      }
    } catch (e) {
      Navigator.pop(context);
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ImportContentTemplate(
      phraseController: _phraseController,
      titleController: _titleController,
      associatedPhrasesController: _associatedPhrasesController,
      keywordsController: _keywordsController,
      onImport: _importContent,
      onPickVideo: _pickVideo,
      onPickImage: _pickImage,
      videoFile: _videoFile,
      imageFile: _imageFile,
      onCategoryChanged: (v) => setState(() => _selectedCategory = v),
      onLevelChanged: (v) => setState(() => _selectedLevel = v),
      selectedCategory: _selectedCategory,
      selectedLevel: _selectedLevel,
    );
  }
}