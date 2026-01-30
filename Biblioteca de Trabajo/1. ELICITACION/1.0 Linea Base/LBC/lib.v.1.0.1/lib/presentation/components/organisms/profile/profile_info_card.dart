import 'package:flutter/material.dart';

class ProfileInfoCard extends StatelessWidget {
  final String name;
  final String email;
  final String role;
  final String birthday;
  final VoidCallback onLogout;

  const ProfileInfoCard({
    super.key,
    required this.name,
    required this.email,
    required this.role,
    required this.birthday,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 60,
          backgroundColor: const Color.fromRGBO(8, 153, 253, 0.1),
          child: Text(
            name.isNotEmpty ? name[0].toUpperCase() : '?',
            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Color.fromRGBO(8, 153, 253, 1.0)),
          ),
        ),
        const SizedBox(height: 24),
        Card(
          elevation: 0,
          color: const Color.fromRGBO(241, 241, 241, 1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                _buildInfoRow(Icons.person, "Nombre", name),
                const Divider(),
                _buildInfoRow(Icons.email, "Correo", email),
                const Divider(),
                _buildInfoRow(Icons.badge, "Rol", role),
                const Divider(),
                _buildInfoRow(Icons.cake, "Cumpleaños", birthday),
              ],
            ),
          ),
        ),
        const SizedBox(height: 32),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton.icon(
            onPressed: onLogout,
            icon: const Icon(Icons.logout),
            label: const Text('Cerrar Sesión'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey[600], size: 20),
          const SizedBox(width: 12),
          Text("$label:", style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 8),
          Expanded(child: Text(value, textAlign: TextAlign.right, overflow: TextOverflow.ellipsis)),
        ],
      ),
    );
  }
}