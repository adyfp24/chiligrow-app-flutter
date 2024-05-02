part of '../page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  void _toDetailRegist(BuildContext context) {
    Navigator.pushNamed(context, '/regist-detail');
  }

  @override  
  Widget build(BuildContext context) {
    final TapGestureRecognizer _toLogin = TapGestureRecognizer();
    _toLogin.onTap = () {
      Navigator.pushNamed(context, '/login');
    };
  
    void _toDetailRegist(){
      Navigator.pushNamed(context, '/regist-detail');
    }
    return Scaffold(
      backgroundColor: kColorGreen,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Daftar',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 35,
            ),
            Container(
              width: 300,
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('img/regist-img.png'),
                    fit: BoxFit.contain),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Container(
              width: 260, // Sesuaikan lebar sesuai kebutuhan
              height: 60, // Sesuaikan tinggi sesuai kebutuhan
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(25), // Mengatur ujung menjadi bulat
                color: Color(0xFF30E5D0), // Mengatur warna latar belakang
              ),
              child: TextButton(
                onPressed: _toDetailRegist,
                child: Text(
                  'Mulai Sekarang',
                  style: TextStyle(
                      color: Colors.white, // Mengatur warna teks
                      fontSize: 20,
                      fontWeight: FontWeight
                          .w600 // Sesuaikan ukuran teks sesuai kebutuhan
                      ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.center,
              child: Text.rich(
                TextSpan(
                  text: 'Sudah punya akun? ',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                  children: [
                    TextSpan(
                        text: 'Masuk',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF30E5D0),
                        ),
                        recognizer: _toLogin),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
