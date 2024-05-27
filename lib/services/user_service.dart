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

  Future<int> getOTP(String email) async {
  final url = Uri.parse('${ApiHelper.baseUrl}/forget');
  try {
    final response = await http.post(
      url,
      headers: ApiHelper.getHeaders(''),
      body: jsonEncode({'email': email})
    );
    final responseData = ApiHelper.handleResponse(response);
    if (!responseData['success']) {
      throw Exception(responseData['message']);
    }
    return int.parse(responseData['data']['otp']);
  } catch (e) {
    throw ApiHelper.handleError(e);
  }
}

  Future<void> verifyOTP (OTP otp) async {
    final url = Uri.parse('${ApiHelper.baseUrl}/verify-otp');
    try {
      final response = await http.post(
        url,
        headers: ApiHelper.getHeaders(''),
        body: jsonEncode(otp.toJson())
      );
      return ApiHelper.handleResponse(response);
    } catch (e) {
      return ApiHelper.handleError(e);
    }
  }

  Future<void> resetPassword (String email, String newPassword) async {
    final url = Uri.parse('${ApiHelper.baseUrl}/reset-password');
    try {
      final response = await http.put(
        url,
        headers: ApiHelper.getHeaders(''),
        body: jsonEncode({'email': email, 'password': newPassword})
      );
      return ApiHelper.handleResponse(response);
    } catch (e) {
      return ApiHelper.handleError(e);
    }
  }

}


