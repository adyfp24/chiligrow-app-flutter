part of './service.dart';

class UserService {
  Future<dynamic> registerUser(User newUser) async {
    final url = Uri.parse('${ApiHelper.baseUrl}/register');
    try {
      final response = await http.post(
        url,
        headers: ApiHelper.getHeaders(''),
        body: jsonEncode(newUser),
      );
      return ApiHelper.handleResponse(response);
    } catch (e) {
      return ApiHelper.handleError(e);
    }
  }

  Future<dynamic> loginUser(User user) async {
    final url = Uri.parse('${ApiHelper.baseUrl}/login');
    try {
      final response = await http.post(
        url,
        headers: ApiHelper.getHeaders(''),
        body: jsonEncode(user),
      );
      return ApiHelper.handleResponse(response);
    } catch (e) {
      return ApiHelper.handleError(e);
    }
  }

  Future<dynamic> getProfile(String token) async {
    final url = Uri.parse('${ApiHelper.baseUrl}/profile');
    try {
      final response = await http.get(
        url,
        headers: ApiHelper.getHeaders(token),
      );
      return ApiHelper.handleResponse(response);
    } catch (e) {
      return ApiHelper.handleError(e);
    }
  }

  Future<void> updateProfile(String token, User user) async {
    final url = Uri.parse('${ApiHelper.baseUrl}/profile');
    try {
      final response = await http.put(
        url,
        headers: ApiHelper.getHeaders(token),
        body: jsonEncode(user),
      );
      return ApiHelper.handleResponse(response);
    } catch (e) {
      return ApiHelper.handleError(e);
    }
  }
}