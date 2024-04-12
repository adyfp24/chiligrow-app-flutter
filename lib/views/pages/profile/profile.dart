part of '../page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    userProvider.getProfile();

    // Perbarui pengguna setiap kali ada perubahan di UserProvider
    final List<User> users = userProvider.users;
    if (users.isEmpty) {
      // Jika tidak ada pengguna, mungkin Anda ingin menampilkan indikator loading atau pesan lainnya
      return Center(child: CircularProgressIndicator());
    }
    final User loggedInUser = users.first;
    // final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _addressController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _phoneNumberController =
        TextEditingController();

    // final User loggedInUser = userProvider.users.first;

    // Mengisi data pengguna ke dalam TextField
    // _usernameController.text = loggedInUser.username;
    _emailController.text = loggedInUser.email;
    _phoneNumberController.text = loggedInUser.noHP;
    _addressController.text = loggedInUser.alamat;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('profile'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Profile',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '${loggedInUser.username}',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 30),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'No. Handphone',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 5),
            TextField(
              controller: _phoneNumberController,
              decoration: InputDecoration(
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.green), // Opsional: warna garis bawah
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Email',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 5),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.green), // Opsional: warna garis bawah
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Alamat',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 5),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.green), // Opsional: warna garis bawah
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              width: 150, // Sesuaikan lebar sesuai kebutuhan
              height: 50, // Sesuaikan tinggi sesuai kebutuhan
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(10), // Mengatur ujung menjadi bulat
                color: Color(0xFF30E5D0), // Mengatur warna latar belakang
              ),
              child: TextButton(
                onPressed: () {
                  final user = User(
                    idUser: loggedInUser
                        .idUser, // Dummy ID, tidak diperlukan untuk login
                    username: loggedInUser.username,
                    password: loggedInUser.password,
                    alamat:
                        _addressController.text, // Tidak diperlukan untuk login
                    email:
                        _emailController.text, // Tidak diperlukan untuk login
                    noHP: _phoneNumberController
                        .text, // Tidak diperlukan untuk login
                    role: loggedInUser.role, // Tidak diperlukan untuk login
                  );
                  Provider.of<UserProvider>(context, listen: false)
                      .updateProfile(user)
                      .then((_) async {
                    // final prefs = FlutterSecureStorage();
                    // final token = await prefs.read(key: 'token');
                    // print(token);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Profile updated successfully')),
                    );
                  }).catchError((error) {
                    print(error);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content:
                              Text('Failed to update credentials: $error')),
                    );
                  });
                },
                child: Text(
                  'Update Profile',
                  style: TextStyle(
                      color: Colors.white, // Mengatur warna teks
                      fontSize: 15,
                      fontWeight: FontWeight
                          .w600 // Sesuaikan ukuran teks sesuai kebutuhan
                      ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              child: Text(
                'Logout',
                style: TextStyle(
                  color: Colors.black, // Mengatur warna teks
                  fontSize: 15,
                  fontWeight:
                      FontWeight.bold, // Sesuaikan ukuran teks sesuai kebutuhan
                ),
              ),
              onTap: (){
                Navigator.pushNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
    );
  }
}
