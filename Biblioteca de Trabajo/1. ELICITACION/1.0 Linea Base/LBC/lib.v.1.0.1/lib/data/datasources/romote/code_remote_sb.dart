import 'package:mingo/core/services/supa_base_service.dart';

class CodeRemoteSb {
  Future<Map<String, dynamic>?> fetchCode(String code) async {
    try {
      final response = await SupaBaseService.client
          .from('codes')
          .select()
          .eq('code', code)
          .maybeSingle(); // Retorna null si no lo encuentra, o el objeto si existe

      return response;
    } catch (e) {
      print('Error en fetchCode: $e');
      throw Exception('Error en DataSource: $e');
    }
  }

  Future<bool> createCode(String code) async {
    try {
      // 1. Buscamos si ya existe una fila con ese código
      final existingData = await SupaBaseService.client
          .from('codes')
          .select()
          .eq('code', code)
          .maybeSingle(); // Retorna null si no encuentra nada en lugar de lanzar error

      // 2. Si el resultado no es nulo, el código ya existe
      if (existingData != null) {
        print('El código $code ya existe en la base de datos.');
        return false;
      }

      // 3. Si no existe, procedemos a insertarlo
      await SupaBaseService.client
          .from('codes')
          .insert({'code': code});

      return true;
    } catch (e) {
      print('Error en createCode: $e');
      return false;
    }
  }

  Future<List<Map<String, dynamic>>> fetchCodes() async {
    try {
      var query = SupaBaseService.client
          .from('codes')
          .select();

      final List<Map<String, dynamic>> response = await query.order('id', ascending: true);

      return response;
    } catch (e) {
      print('Error en fetchCodes: $e');
      throw Exception('Error en DataSource: $e');
    }
  }

}