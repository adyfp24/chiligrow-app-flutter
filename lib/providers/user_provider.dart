part of './provider.dart';

class UserProvider extends ChangeNotifier {
  List<User> _users = [];
  List<User> get users => _users;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> registerUser(User newUser) async {
    _isLoading = true;
    notifyListeners();

    final url = Uri.parse('http://localhost:4000/api/v1/register');
    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(newUser.toJson()),
      );
      if (response.statusCode == 201) {
        final responseData = json.decode(response.body)['data'];
        print(responseData); // optional, for debugging
        // Add new user to local list if registration successful
        _users.add(User.fromJson(responseData));
        notifyListeners();
      } else {
        throw Exception('Failed to register user');
      }
    } catch (e) {
      print('Error registering user: $e');
      throw Exception('Failed to register user');
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> loginUser(User user) async {
    _isLoading = true;
    notifyListeners();

    final url = Uri.parse('http://localhost:4000/api/v1/login');
    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(user.toJson()),
      );
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print(responseData); // optional, for debugging
      } else {
        throw Exception('Failed to login');
      }
    } catch (e) {
      print('Error logging in: $e');
      throw Exception('Failed to login');
    }

    _isLoading = false;
    notifyListeners();
  }
}
