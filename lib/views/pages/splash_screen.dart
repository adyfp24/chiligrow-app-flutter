part of 'page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  Future<void> _toNextPage(BuildContext context) async {
    final UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    await Future.delayed(Duration(seconds: 2),);
    final secureStorage = FlutterSecureStorage();
    final token = await secureStorage.read(key: 'token');

    if (token != null) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      Navigator.pushReplacementNamed(context, '/regist');
    }
  }

  @override
  Widget build(BuildContext context) {
    _toNextPage(context);

    return Scaffold(
      backgroundColor: Color(0xFFE1FCF9),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 180,
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('img/chiligrow.png'),
                    fit: BoxFit.contain),
              ),
            ),
            SizedBox(height: 50),
            Text(
              'Chili-grow',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 15),
            Text(
              'improve your farm experience',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
