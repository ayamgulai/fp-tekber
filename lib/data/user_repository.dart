import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class UserRepository {
  final String baseUrl;

  UserRepository({required this.baseUrl});

  // Simulasi penyimpanan data user ke backend
  Future<bool> registerUser(User user) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(user.toJson()),
      );

      if (response.statusCode == 201) {
        return true; // Data berhasil disimpan
      } else {
        return false; // Gagal menyimpan data
      }
    } catch (e) {
      return false; // Error saat request
    }
  }

  // Simulasi autentikasi user dengan backend
  Future<bool> loginUser(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        return true; // Login berhasil
      } else {
        return false; // Login gagal
      }
    } catch (e) {
      return false; // Error saat request
    }
  }

  // Mendapatkan data profil
  Future<Map<String, String>> fetchProfile() async {
    final response = await http.get(Uri.parse('$baseUrl/profile'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return {
        'name': data['name'],
        'email': data['email'],
      };
    } else {
      throw Exception('Failed to load profile');
    }
  }

// Memperbarui data profil
  Future<void> updateProfile(String name, String email) async {
    final response = await http.put(
      Uri.parse('$baseUrl/profile'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'name': name, 'email': email}),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update profile');
    }
  }
}
