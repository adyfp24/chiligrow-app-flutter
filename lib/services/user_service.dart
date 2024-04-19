part of './service.dart';

class UserService {
  final String baseUrl = 'http://localhost:4000/api/v1';

  Future<dynamic> registerUser(User newUser) async {
    final url = Uri.parse('$baseUrl/register');
    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(newUser),
      );
      if (response.statusCode == 201) {
        final responseData = json.decode(response.body)['data'];
        return responseData;
      } else {
        throw Exception('Failed to register user');
      }
    } catch (e) {
      print('Error registering user: $e');
      throw Exception('Failed to register user');
    }
  }

  Future<dynamic> loginUser(User user) async {
    final url = Uri.parse('$baseUrl/login');
    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(user),
      );
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        return responseData;
      } else {
        throw Exception('username atau password salah').toString();
      }
    } catch (e) {
      print('Error logging in: $e');
      throw Exception('username atau password salah').toString();
    }
  }

  Future<dynamic> getProfile(String token) async {
    final url = Uri.parse('$baseUrl/profile');
    try {
      final response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body)['data'];
        return responseData;
      } else {
        throw Exception('Failed to get profile');
      }
    } catch (e) {
      print('Error getting profile: $e');
      throw Exception('Failed to get profile');
    }
  }

  Future<void> updateProfile(String token, User user) async {
    final url = Uri.parse('$baseUrl/profile');
    try {
      final response = await http.put(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(user),
      );
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body)['data'];
        return responseData;
      } else {
        throw Exception('Failed to update profile');
      }
    } catch (e) {
      print('Error updating profile: $e');
      throw Exception('Failed to update profile');
    }
  }
}
