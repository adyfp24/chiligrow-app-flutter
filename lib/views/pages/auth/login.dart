part of '../page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final user = User(
                  idUser: 0, // Dummy ID, tidak diperlukan untuk login
                  username: _usernameController.text,
                  password: _passwordController.text,
                  alamat: '', // Tidak diperlukan untuk login
                  email: '', // Tidak diperlukan untuk login
                  noHP: '', // Tidak diperlukan untuk login
                  role: '', // Tidak diperlukan untuk login
                );
                Provider.of<UserProvider>(context, listen: false)
                    .loginUser(user)
                    .then((_) {
                  Navigator.pushNamed(context, '/home');
                }).catchError((error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to login: $error')),
                  );
                });
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
