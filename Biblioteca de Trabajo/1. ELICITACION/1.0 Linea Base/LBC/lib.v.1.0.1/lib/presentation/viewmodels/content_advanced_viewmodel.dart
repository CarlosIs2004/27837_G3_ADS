import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mingo/data/models/content_model.dart';
import 'package:mingo/data/repository/content_repository.dart';

class ContentAdvancedViewmodel extends ChangeNotifier {

  //Injeccion de dependencia del repositorio
  final ContentRepository repo;

  ContentAdvancedViewmodel(this.repo);

  //Lista de contenido avanzado
  List<ContentModel> advanced = [];

  //Estado de carga del contenido
  bool loading = false;

  //Metodo para buscar en el contenido
  Future<void> loadContenetAdvanced() async {
    loading = true;
    notifyListeners();

    advanced = await repo.getContents(null, 3);

    loading = false;
    notifyListeners();

  }

  //Metodo para subir un contenido
  Future<void> uploadContentAdvanced({required title, required description, required idCategory, required idLevel, required File imageFile}) async {
    await repo.insertFile(
        title: title,
        description: description,
        idCategory: idCategory,
        idLevel: idLevel,
        imageFile: imageFile
    );

    await loadContenetAdvanced();

  }


}