import 'package:mingo/core/services/supa_base_service.dart';

class ContentRemoteSb {

  Future<List<Map<String, dynamic>>> fetchContents(int? idCategory, int? idLevel) async {
    try {
      var query = SupaBaseService.client
          .from('content')
          .select();

      if (idCategory != null) {
        query = query.eq('id_category', idCategory);
      }

      if (idLevel != null) {
        query = query.eq('id_level', idLevel);
      }

      final List<Map<String, dynamic>> response = await query.order('id', ascending: true);

      return response;
    } catch (e) {
      print('Error en fetchContents: $e');
      throw Exception('Error en DataSource: $e');
    }
  }

  Future<void> insertFile(Map<String, dynamic> content) async {

    await SupaBaseService.client.from('content').insert(content);

  }


}