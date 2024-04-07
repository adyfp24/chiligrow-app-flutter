part of 'model.dart';

class User {
  final int idUser;
  final String username;
  final String password;
  final String alamat;
  final String email;
  final String noHP;
  final String role;

  User({
    required this.idUser,
    required this.username,
    required this.password,
    required this.alamat,
    required this.email,
    required this.noHP,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      idUser: json['id_user'] as int,
      username: json['username'] as String,
      password: json['password'] as String,
      alamat: json['alamat'] as String,
      email: json['email'] as String,
      noHP: json['no_hp'] as String,
      role: json['role'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_user': idUser,
      'username': username,
      'password': password,
      'alamat': alamat,
      'email': email,
      'no_hp': noHP,
      'role': role,
    };
  }
}
