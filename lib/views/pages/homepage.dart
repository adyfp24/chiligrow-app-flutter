part of 'page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const [
        HomeFragment(),
        PenyiramanFragment(),
        PemupukanFragment(),
        SimulasiFragment()
      ][_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.water_outlined),
            label: 'penyiraman',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.broken_image_outlined),
            label: 'pemupukan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.query_stats_rounded),
            label: 'simulasi',
          ),
        ],
        selectedFontSize: 14, // Ukuran teks saat terpilih
        unselectedFontSize: 14,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromRGBO(175, 245, 237, 1),
        elevation: 0,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
