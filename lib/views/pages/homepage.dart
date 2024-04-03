part of 'page.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        HomeFragment(),
      ][_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'penyiraman',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'pemupukan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pages),
            label: 'profile',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.lightBlue[100],
        elevation: 0,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}