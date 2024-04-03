part of 'fragment.dart';

class HomeFragment extends StatelessWidget {
  const HomeFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
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
                  Container(
                        width: 40,
                        height: 40,
                        margin: EdgeInsets.only(top: 0, right: 10),
                        child: ClipOval(
                          child: Image.asset(
                            'img/profil.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 30,
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
                  'Hai, Petani X 👋',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
                ),
                Text(
                  '🏠 jember',
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
              width: 31,
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
                Container(
                  width: 140,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage('img/penyiraman.png'),
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 140,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage('img/pemupukan.png'),
                        fit: BoxFit.cover),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              children: [
                Container(
                  width: 140,
                  height: 260,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage('img/simulasi.png'),
                        fit: BoxFit.cover),
                  ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
