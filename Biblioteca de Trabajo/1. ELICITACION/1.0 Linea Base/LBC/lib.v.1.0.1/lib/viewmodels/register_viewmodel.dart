import 'package:flutter/widgets.dart';
import 'package:mingo/models/user.dart';
import 'package:mingo/services/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
//Es la capa donde notificamos a la vista y recibe las acciones de la vista
class RegisterViewModel extends ChangeNotifier {
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;
  final DatabaseService _dbService = DatabaseService();

  bool _loading = false;
  String mensaje = "";

  bool get loading => _loading;


  Future<bool> register({
    required String name,
    required String email,
    required String password,
    required String dateText, // Recibimos el String "31/12/2025"
    required String role,
  }) async {
    _loading = true;
    notifyListeners(); // Avisamos a la vista que estamos cargando
    try {
      DateTime birthDate = parseDateString(dateText);
      User user = User(
        name: name,
        email: email,
        password: password,
        rol: role,
        dateTime: birthDate, // ¡Aquí va el DateTime arreglado!
      );
      //1. Aquí creamos el usuario en FirebaseAuth
      final credential = await _auth.createUserWithEmailAndPassword(email: user.email, password: user.password);
      final String uid =  credential.user!.uid;

      // 2. Guardamos los datos en Firestore

      await _dbService.addUser(user, uid);
      _loading = false;
      mensaje = "Registro exitoso" ;
      notifyListeners();
      return true;
    } catch (e) {
      print("Error en ViewModel: $e");
      _loading = false;
      mensaje = "Error al registrar: $e";
      notifyListeners();
      return false;
    }
  }

  DateTime parseDateString(String dateInput) {
    try {
      // dateInput viene como "dd/mm/yyyy" (ej: "31/12/2025")
      List<String> parts = dateInput.split('/');

      // Convertimos a DateTime: Año, Mes, Día
      return DateTime(
          int.parse(parts[2]), // Año
          int.parse(parts[1]), // Mes
          int.parse(parts[0])  // Día
      );
    } catch (e) {
      print("Error parsing date: $e");
      return DateTime.now(); // Fecha por defecto si falla
    }
  }
}
