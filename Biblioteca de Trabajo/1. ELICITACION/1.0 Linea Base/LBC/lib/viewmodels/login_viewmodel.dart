import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = "";
  String get errorMessage => _errorMessage;

  // Función para iniciar sesión
  Future<bool> login({ required String email, required String password}) async {
    _isLoading = true;
    _errorMessage = "";
    notifyListeners();

    try {
      // Intentamos entrar con correo y contraseña
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Si no hay error, es que entró bien
      _isLoading = false;
      notifyListeners();
      return true;

    } on FirebaseAuthException catch (e) {
      _isLoading = false;
      // Traducimos los errores de Firebase a español para el usuario
      if (e.code == 'user-not-found') {
        _errorMessage = "No existe un usuario con ese correo.";
      } else if (e.code == 'wrong-password') {
        _errorMessage = "Contraseña incorrecta.";
      } else if (e.code == 'invalid-email') {
        _errorMessage = "El correo no es válido.";
      } else {
        _errorMessage = "Error: ${e.message}";
      }
      notifyListeners();
      return false;

    } catch (e) {
      _isLoading = false;
      _errorMessage = "Error desconocido. Revisa tu conexión.";
      notifyListeners();
      return false;
    }
  }
}