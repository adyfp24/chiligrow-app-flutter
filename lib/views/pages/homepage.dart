part of 'page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void setSelectedIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: [
          HomeFragment(),
          PenyiramanFragment(),
          PemupukanFragment(),
          SimulasiFragment()
        ][_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.water_outlined),
              label: 'Penyiraman',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.broken_image_outlined),
              label: 'Pemupukan',  
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.query_stats_rounded),
              label: 'Simulasi',
            ),
          ],
          selectedFontSize: 12, 
          unselectedFontSize: 12,
          selectedItemColor: const Color.fromRGBO(0, 133, 117, 1),
          unselectedItemColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color.fromRGBO(175, 245, 237, 1),
          elevation: 0,
          currentIndex: _selectedIndex,
          onTap: setSelectedIndex,
        ),
      ),
    );
  }
}
