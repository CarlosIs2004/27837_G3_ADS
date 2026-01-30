import 'dart:io';
import 'package:mingo/core/services/supa_base_service.dart';
import 'package:path/path.dart' as p;

class StorageService {

  // Nombre del bucket en Supabase.
  static const String _bucketName = 'files';


  /// Sube un archivo en la carpeta 'files' y retorna su URL.
  Future<String?> uploadImage(File file) async {
    return _uploadGenericFile(file, 'images');
  }

  // --- MÉTODOS PRIVADOS ---

  /// Método genérico que maneja la lógica de subida para cualquier tipo de archivo
  Future<String?> _uploadGenericFile(File file, String folderName) async {
    // Generamos la ruta completa: ej. "images/12345678.jpg"
    final String fileName = _generateUniqueName(file);
    final String fullPath = '$folderName/$fileName';

    // Referencia al bucket
    final storage = SupaBaseService.client.storage.from(_bucketName);

    // Subimos el archivo
    await storage.upload(fullPath, file);

    // Obtenemos y retornamos la URL
    return storage.getPublicUrl(fullPath);
  }


  /// Genera un nombre único usando timestamp y la extensión original
  String _generateUniqueName(File file) {
    final ext = p.extension(file.path); // Usa 'path' siempre, es más seguro
    return '${DateTime.now().millisecondsSinceEpoch}$ext';
  }

}