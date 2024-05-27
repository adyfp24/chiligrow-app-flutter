part of '../page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late TextEditingController _addressController;
  late TextEditingController _emailController;
  late TextEditingController _phoneNumberController;

  late String _initialAddress;
  late String _initialEmail;
  late String _initialPhoneNumber;

  @override
  void initState() {
    super.initState();
    _addressController = TextEditingController();
    _emailController = TextEditingController();
    _phoneNumberController = TextEditingController();
    checkToken();
    getUserData();
  }

  void getUserData() {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.getProfile();
  }

  Future<void> checkToken() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final token = await userProvider.getTokenFromStorage();
    if (token == null) {
      // Jika tidak ada token, arahkan pengguna ke halaman login
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    final List<User> users = userProvider.users;
    if (users.isEmpty) {
      return Center(child: CircularProgressIndicator());
    }
    final User loggedInUser = users.first;

    // Mengisi data pengguna ke dalam TextField
    _emailController.text = loggedInUser.email;
    _phoneNumberController.text = loggedInUser.noHP;
    _addressController.text = loggedInUser.alamat;

    // Menyimpan nilai awal
    _initialEmail = loggedInUser.email;
    _initialPhoneNumber = loggedInUser.noHP;
    _initialAddress = loggedInUser.alamat;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(''),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Data Profil',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Container(
                  width: 100,
                  height: 100,
                  child: Image(
                      image: AssetImage('assets/img/profil.png'),
                      fit: BoxFit.cover)
                  // decoration: BoxDecoration(
                  //   image: DecorationImage(image: AssetImage('img/profil.png'), fit: BoxFit.fill),
                  // ),
                  ),
              SizedBox(height: 10),
              Text(
                '${loggedInUser.username}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'No. Telepon',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 5),
              TextField(
                controller: _phoneNumberController,
                keyboardType: TextInputType.phone,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
              ),
              SizedBox(height: 20),
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
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
              ),
              SizedBox(height: 20),
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
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Container(
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF30E5D0),
                ),
                child: TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Konfirmasi"),
                          content: Text("Apakah anda yakin untuk memperbarui?"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                // Mengembalikan nilai awal jika batal
                                _emailController.text = _initialEmail;
                                _phoneNumberController.text = _initialPhoneNumber;
                                _addressController.text = _initialAddress;
                                Navigator.pop(context); // Tutup dialog
                              },
                              child: Text("Tidak",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 218, 54, 42))),
                            ),
                            TextButton(
                              onPressed: () {
                                final user = User(
                                  idUser: loggedInUser.idUser,
                                  username: loggedInUser.username,
                                  password: loggedInUser.password,
                                  alamat: _addressController.text,
                                  email: _emailController.text,
                                  noHP: _phoneNumberController.text,
                                  role: loggedInUser.role,
                                );
                                Provider.of<UserProvider>(context,
                                        listen: false)
                                    .updateProfile(user)
                                    .then((_) {
                                  getUserData();
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text('Data akun berhasil diubah')),
                                  );
                                }).catchError((error) {
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(             
                                    SnackBar(
                                        content:
                                            Text('Data harus lengkap, harap diisi kembali')),
                                  );
                                });
                              },
                              child: Text(
                                "Iya",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 63, 151, 66)),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text(
                    'Ubah Profil',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  // Tampilkan dialog konfirmasi sebelum logout
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Konfirmasi"),
                        content: Text("Apakah Anda yakin ingin keluar?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context); // Tutup dialog
                            },
                            child: Text("Tidak",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 218, 54, 42))),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context); // Tutup dialog
                              userProvider.logoutUser(context);
                              Provider.of<PemupukanProvider>(context,
                                      listen: false)
                                  .clearData();
                            },
                            child: Text(
                              "Iya",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 63, 151, 66)),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text(
                  'Keluar',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _addressController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }
}