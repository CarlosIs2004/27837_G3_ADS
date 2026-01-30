import 'dart:io';

import 'package:mingo/core/services/storage_service.dart';
import 'package:mingo/data/datasources/romote/content_remote_sb.dart';
import 'package:mingo/data/models/content_model.dart';

class ContentRepository {

  Future<List<ContentModel>> getContents(int? idCategory, int? idLevel) async {

    final data = await ContentRemoteSb().fetchContents(idCategory, idLevel);
    final contents = data.map((content) => ContentModel.fromJson(content)).toList();

    return contents;

  }

  Future<void> insertFile({required title, required description, required idCategory, required idLevel, required File imageFile}) async {

    final imageUrl = await StorageService().uploadImage(imageFile);
    await ContentRemoteSb().insertFile({
      'title': title,
      'description': description,
      'url': imageUrl,
      'id_category': idCategory,
      'id_level': idLevel
    });

  }

}