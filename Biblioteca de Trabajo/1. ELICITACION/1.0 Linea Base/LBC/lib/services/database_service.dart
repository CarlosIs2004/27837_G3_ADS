import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:mingo/models/user.dart';

class DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Función para guardar los datos del formulario
  Future<void> addUser(User user, String uid) async {
    try {
      // Usamos .add() para que Firebase genere un ID único automático por ahora

      await _firestore.collection('usuarios').doc(uid).set(user.toJson());

      print("✅ Usuario guardado en la base de datos");
    } catch (e) {
      print("❌ Error al guardar: $e");
      throw e;
    }
  }
}