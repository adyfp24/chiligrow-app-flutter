part of '../page.dart';

class DetailRegist extends StatelessWidget {
  const DetailRegist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _addressController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _phoneNumberController =
        TextEditingController();

    return Scaffold(
      backgroundColor: Color(0xFF30E5D0),
      body: Column(
        children: [
          SizedBox(height: 100),
          Padding(
            padding: EdgeInsets.only(left: 35),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Lengkapi Data',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        prefixIcon: Icon(Icons.person),
                        labelText: 'Username'),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        prefixIcon: Icon(Icons.lock),
                        labelText: 'Password'),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        prefixIcon: Icon(Icons.mail),
                        labelText: 'Email'),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextField(
                    controller: _addressController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        prefixIcon: Icon(Icons.pin_drop),
                        labelText: 'Alamat'),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextField(
                    controller: _phoneNumberController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        prefixIcon: Icon(Icons.phone_android_rounded),
                        labelText: 'No Handphone'),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: TextButton(
                      onPressed: () {
                        if (_usernameController.text.isEmpty ||
                            _passwordController.text.isEmpty ||
                            _emailController.text.isEmpty ||
                            _phoneNumberController.text.isEmpty ||
                            _addressController.text.isEmpty 
                            ) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Data harus lengkap')),
                          );
                          return;
                        };
                        final newUser = User(
                          idUser:
                              0, // You may adjust this according to your backend requirements
                          username: _usernameController.text,
                          password: _passwordController.text,
                          alamat: _addressController.text,
                          email: _emailController.text,
                          noHP: _phoneNumberController.text,
                          role: 'petani',
                        );
                        Provider.of<UserProvider>(context, listen: false)
                            .registerUser(newUser)
                            .then((_) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('User registered successfully')),
                          );
                          Navigator.pushNamed(context, '/login');
                        }).catchError((error) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content:
                                    Text('Failed to register user')),
                          );
                        });
                      },
                      child: Text(
                        'Daftar',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xFF30E5D0),
                        // primary: Colors.white,
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
