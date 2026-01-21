import 'package:dio/dio.dart';
import '../models/user.dart';

//La capa de servicio es donde manejamos las peticiones con la api o el servicio que consumimos
class RegisterService {
  final Dio dio = Dio();

  Future<bool> registerUser(User user) async {
    try {

      final response = await dio.post(
        'https://tuservidor.com/api/usuarios/registro',
        data: user.toJson(),
      );

      return response.statusCode == 200 || response.statusCode == 201;
    } catch (e) {
      print("Error al registrar usuario: $e");
      return false;
    }
  }
}
