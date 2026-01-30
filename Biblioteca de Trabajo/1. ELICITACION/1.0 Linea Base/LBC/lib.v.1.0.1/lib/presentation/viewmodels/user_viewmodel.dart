import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserViewModel extends ChangeNotifier {
  User? _currentUser;

  User? get currentUser => _currentUser;

  // Getters para facilitar el acceso a la metadata
  String get name => _currentUser?.userMetadata?['full_name'] ?? 'Usuario';
  String get role => _currentUser?.userMetadata?['role'] ?? 'Sin rol';
  String get email => _currentUser?.email ?? '';
  String get birthday => _currentUser?.userMetadata?['birthday'] ?? '';

  // Método para actualizar el usuario en el provider
  void setUser(User? user) {
    _currentUser = user;
    notifyListeners();
  }

  // Método para cerrar sesión y limpiar el provider
  void clearUser() {
    _currentUser = null;
    notifyListeners();
  }
}