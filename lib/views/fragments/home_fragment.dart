part of 'fragment.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({Key? key}) : super(key: key);

  @override
  _HomeFragmentState createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  late Future<void> _loadProfile;

  @override
  void initState() {
    super.initState();
    _loadProfile = _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    await Provider.of<UserProvider>(context, listen: false).getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _loadProfile,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return _buildHomeWidget(context);
        }
      },
    );
  }

  Widget _buildHomeWidget(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final username = userProvider.users.isNotEmpty ? userProvider.users.first.username : 'petani x';
    final alamat = userProvider.users.isNotEmpty ? userProvider.users.first.alamat : 'jember';

    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 25),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: [
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/img/logosementara.png'),
                width: 90,
              ),
              Row(
                 children: [
                  InkWell(
                    child: Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.only(top: 0, right: 0),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/img/profil.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/profile');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
        Container(
          width: 300,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromRGBO(175, 245, 237, 1),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                offset: Offset(0, 3),
                blurRadius: 1,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hai, $username 👋',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
                ),
                Text(
                  '🏠 $alamat',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 30),
        Container(
          width: 300,
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage('assets/img/banner.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 10),
        
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 5),
            Text(
              'semua fitur',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18),
              ),
          ],
        ),
        SizedBox(height: 20),
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
                          image: AssetImage('assets/img/penyiraman.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  onTap: () => {homepageKey.currentState?.setSelectedIndex(1)},
                ),
                SizedBox(height: 20),
                InkWell(
                  child: Container(
                    width: 145,
                    height: 121,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: AssetImage('assets/img/pemupukan.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  onTap: () => {homepageKey.currentState?.setSelectedIndex(2)},
                ),
              ],
            ),
            SizedBox(width: 20),
            InkWell(
              child: Column(
                children: [
                  Container(
                    width: 145,
                    height: 268,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          image: AssetImage('assets/img/simulasi.png'),
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
