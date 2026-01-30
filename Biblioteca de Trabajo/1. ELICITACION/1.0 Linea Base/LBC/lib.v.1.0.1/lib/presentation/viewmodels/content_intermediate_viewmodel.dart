import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mingo/data/models/content_model.dart';
import 'package:mingo/data/repository/content_repository.dart';

class ContentIntermediateViewmodel extends ChangeNotifier {

  //Injeccion de dependencia del repositorio
  final ContentRepository repo;

  ContentIntermediateViewmodel(this.repo);

  //Lista de contenido intermedio
  List<ContentModel> intermediate = [];

  //Estado de carga del contenido
  bool loading = false;

  //Metodo para buscar en el contenido
  Future<void> loadContenetIntermediate() async {
    loading = true;
    notifyListeners();

    intermediate = await repo.getContents(null, 2);

    loading = false;
    notifyListeners();

  }

  //Metodo para subir un contenido
  Future<void> uploadContentIntermediate({required title, required description, required idCategory, required idLevel, required File imageFile}) async {
    await repo.insertFile(
        title: title,
        description: description,
        idCategory: idCategory,
        idLevel: idLevel,
        imageFile: imageFile
    );

    await loadContenetIntermediate();

  }


}