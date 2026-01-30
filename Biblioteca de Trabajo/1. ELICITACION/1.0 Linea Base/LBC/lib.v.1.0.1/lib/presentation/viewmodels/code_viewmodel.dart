import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mingo/data/models/code_model.dart';
import 'package:mingo/data/repository/code_repository.dart';

class CodeViewModel extends ChangeNotifier {
  final CodeRepository repo;
  CodeViewModel(this.repo);

  List<CodeModel> codes = [];
  bool loading = false;

  // Nuevo: Estado para el código actual en pantalla
  String? currentCode;
  bool isCodeRegistered = false;

  // Método para generar un código nuevo (Solo local)
  void generateNewCodeLocally() {
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    currentCode = String.fromCharCodes(Iterable.generate(
        9, (_) => characters.codeUnitAt(Random().nextInt(characters.length))
    ));
    isCodeRegistered = false; // Resetear estado de registro
    notifyListeners();
  }

  // Método para guardar el código en la base de datos
  Future<bool> registerCurrentCode() async {
    if (currentCode == null) return false;

    loading = true;
    notifyListeners();

    bool success = await repo.createCode(currentCode!);

    if (success) {
      isCodeRegistered = true;
      await loadCodes(); // Recargar la lista de códigos si es necesario
    }

    loading = false;
    notifyListeners();
    return success;
  }

  Future<void> loadCodes() async {
    loading = true;
    notifyListeners();
    codes = await repo.fetchCodes();
    loading = false;
    notifyListeners();
  }
}