import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mingo/data/models/content_model.dart';
import 'package:mingo/data/repository/content_repository.dart';

class ContentBeginnerViewModel extends ChangeNotifier {

  //Injeccion de dependencia del repositorio
  final ContentRepository repo;

  ContentBeginnerViewModel(this.repo);

  //Lista de contenido principiante
  List<ContentModel> beginner = [];

  //Estado de carga del contenido
  bool loading = false;

  //Metodo para buscar en el contenido
  Future<void> loadContenetBeginner() async {
    loading = true;
    notifyListeners();

    beginner = await repo.getContents(null, 1);

    loading = false;
    notifyListeners();

  }

  //Metodo para subir un contenido
  Future<void> uploadContentBeginner({required title, required description, required idCategory, required idLevel, required File imageFile}) async {
    await repo.insertFile(
      title: title,
      description: description,
      idCategory: idCategory,
      idLevel: idLevel,
      imageFile: imageFile
    );

    await loadContenetBeginner();

  }


}