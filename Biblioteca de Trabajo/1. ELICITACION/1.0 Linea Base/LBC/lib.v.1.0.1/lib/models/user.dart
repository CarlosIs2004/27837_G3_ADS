//Son los modelos con los cuales vamos a trabajar en la aplicacion
//No va nada de logica

class User {
  final String name;
  final String email;
  final String password;
  final String rol;
  final DateTime dateTime;

  User({
    required this.name,
    required this.email,
    required this.password,
    required this.rol,
    required this.dateTime,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'rol': rol,
      'dateTime': dateTime.toIso8601String(),
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      rol: json['rol'],
      dateTime: DateTime.parse(json['dateTime']),
    );
  }
}
