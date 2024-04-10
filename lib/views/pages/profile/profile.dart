part of '../page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('profile'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text('Profile'),
            SizedBox(height: 40),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(height: 20),
            Text('Nama User'),
            SizedBox(height: 25),
            TextField(
              controller: null,
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
              controller: null,
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
              controller: null,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'Password'),
            ),
            SizedBox(
              height: 60,
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
                onPressed: null,
                child: Text(
                  'Update Profile',
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
              height: 25,
            ),
            Text('logout')
          ],
        ),
      ),
    );
  }
}
