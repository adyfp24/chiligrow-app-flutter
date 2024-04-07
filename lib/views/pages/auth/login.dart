part of '../page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    return Center(
      child: Text('login'),
    );
  }
}