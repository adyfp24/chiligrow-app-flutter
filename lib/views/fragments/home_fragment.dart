part of 'fragment.dart';

class HomeFragment extends StatelessWidget {
  const HomeFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    final List<User> users = userProvider.users;
    if (users.isEmpty) {
      return Center(child: CircularProgressIndicator());
    }
    final User loggedInUser = users.first;
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 25),
      shrinkWrap: true,
      scrollDirection: Axis.vertical, // Tambahkan scrollDirection
      children: [
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('img/logosementara.png'),
                width: 90,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.notification_add_sharp),
                  ),
                  InkWell(
                    child: Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.only(top: 0, right: 0),
                      child: ClipOval(
                        child: Image.asset(
                          'img/profil.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    onTap: (){
                      Navigator.pushNamed(context, '/profile');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Container(
          width: 300,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromRGBO(175, 245, 237, 1),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4), // Warna bayangan
                offset: Offset(0, 3), // Bayangan akan muncul 2 pixel ke bawah
                blurRadius: 1,
                spreadRadius:
                    0, // Perpindahan bayangan secara horizontal dan vertikal
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hai, ${loggedInUser.username} 👋',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
                ),
                Text(
                  '🏠 ${loggedInUser.alamat}',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Container(
          width: 300,
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage('img/banner.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment
              .center, // Untuk membuat ruang yang sama di antara setiap bulatan
          children: [
            Container(
              width: 13,
              height: 13,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromRGBO(0, 133, 117, 1),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Container(
              width: 13,
              height: 13,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Container(
              width: 13,
              height: 13,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 5,
            ),
            Text(
              'semua fitur',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                InkWell(
                  child: Container(
                    width: 145,
                    height: 121,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: AssetImage('img/penyiraman.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  onTap: () => {homepageKey.currentState?.setSelectedIndex(1)},
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  child: Container(
                    width: 145,
                    height: 121,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: AssetImage('img/pemupukan.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  onTap: () => {homepageKey.currentState?.setSelectedIndex(2)},
                ),
              ],
            ),
            SizedBox(
              width: 20,
            ),
            InkWell(
              child: Column(
                children: [
                  Container(
                    width: 145,
                    height: 268,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          image: AssetImage('img/simulasi.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                ],
              ),
              onTap: () => {homepageKey.currentState?.setSelectedIndex(3)},
            ),
          ],
        )
      ],
    );
  }
}
