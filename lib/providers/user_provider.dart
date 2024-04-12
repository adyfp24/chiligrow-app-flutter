part of './provider.dart';

class UserProvider extends ChangeNotifier {
  List<User> _users = [];
  List<User> get users => _users;

  late final FlutterSecureStorage _secureStorage;
  UserProvider() : _secureStorage = FlutterSecureStorage();

  String? _token;
  String? get token => _token;

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
        _token = responseData['token'];
        _users.add(User.fromJson(responseData['data']));
        print(responseData); // optional, for debugging
        await _secureStorage.write(key: 'token', value: _token!);
        final storedToken = await _secureStorage.read(key: 'token');
        if (storedToken != null) {
          print('Token sudah tersimpan ${storedToken}');
        }
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

  Future<void> getProfile() async {
    _isLoading = true;
    notifyListeners();

    final url = Uri.parse('http://localhost:4000/api/v1/profile');
    try {
      final response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${_token}',
        },
      );
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body)['data'];
        _users.add(User.fromJson(responseData));
        print(_users); // optional, for debugging
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

  Future<void> updateProfile(User user) async {
    _isLoading = true;
    notifyListeners();

    final url = Uri.parse('http://localhost:4000/api/v1/profile');
    try {
      final response = await http.put(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${_token}',
        },
        body: jsonEncode(user.toJson()),
      );
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        _users.add(User.fromJson(responseData['data']));
        print(responseData); // optional, for debugging

        // await _secureStorage.write(key: 'token', value: _token!);
      } else {
        throw Exception('Failed to update');
      }
    } catch (e) {
      print('Error logging in: $e');
      throw Exception('Failed to update');
    }

    _isLoading = false;
    notifyListeners();
  }

  // Future<void> logoutUser() async {
  //   _isLoading = true;
  //   notifyListeners();

  //       _users.));
  //       // optional, for debugging

  //   _isLoading = false;
  //   notifyListeners();
  // }
}
