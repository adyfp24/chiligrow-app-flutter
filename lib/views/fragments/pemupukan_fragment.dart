part of 'fragment.dart';

class PemupukanFragment extends StatefulWidget {
  const PemupukanFragment({Key? key}) : super(key: key);

  @override
  State<PemupukanFragment> createState() => _PemupukanFragmentState();
}

class _PemupukanFragmentState extends State<PemupukanFragment>
    with TickerProviderStateMixin {
  late TabController _tabBarController;
  late TextEditingController _dayController;
  late TextEditingController _timeController;
  late PemupukanProvider _pemupukanProvider;

  @override
  void initState() {
    super.initState();
    _dayController = TextEditingController();
    _timeController = TextEditingController();
    _pemupukanProvider = Provider.of<PemupukanProvider>(context, listen: false);
    _pemupukanProvider.getPemupukanData();
    _tabBarController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // Dispose TabController
    _tabBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    final List<User> users = userProvider.users;
    final User loggedInUser = users.first;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pemupukan Otomatis',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        backgroundColor: Color.fromRGBO(175, 245, 237, 1),
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => {homepageKey.currentState!.setSelectedIndex(0)},
        ),
        elevation: 0,
        bottom: TabBar(
          tabs: const <Widget>[
            Text(
              'Data Jadwal',
            ),
            Text('History'),
          ],
          controller: _tabBarController, 
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: _pemupukanProvider.jadwalPupuk == null
            ? PemupukanEmptyFragment()
            : TabBarView(
                children: <Widget>[
                  JadwalPemupukan(selangHari: _pemupukanProvider.jadwalPupuk!.selangHari , selangJam: _pemupukanProvider.jadwalPupuk!.selangJam),
                  HistoryPemupukan(),
                ],
                controller: _tabBarController, 
              ),
      ),
    );
  }
}

// : Column(
//     children: [
//       SizedBox(height: 40),
//       HistoryButton(),
//       SizedBox(height: 40),
//       Text('get data pemupukan'),
//       SizedBox(
//         height: 10,
//       ),
//       Text(
//           'selang hari : ${_pemupukanProvider.jadwalPupuk?.selangHari}'),
//       SizedBox(
//         height: 10,
//       ),
//       Text(
//           'setiap jam : ${_pemupukanProvider.jadwalPupuk?.selangJam}'),
//       SizedBox(
//         height: 20,
//       ),
//       Text('tambah jadwal pemupukan'),
//       SizedBox(
//         height: 20,
//       ),
//       TextField(
//         controller: _dayController,
//         decoration: InputDecoration(
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(15),
//             ),
//             prefixIcon: Icon(Icons.youtube_searched_for_outlined),
//             labelText: 'Selang Hari'),
//       ),
//       SizedBox(
//         height: 20,
//       ),
//       TextField(
//         controller: _timeController,
//         decoration: InputDecoration(
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(15),
//             ),
//             prefixIcon: Icon(Icons.schedule),
//             labelText: 'Waktu Pemupukan'),
//       ),
//       Container(
//         width: double.infinity,
//         height: 50,
//         child: TextButton(
//           onPressed: () {
//             final newJadwal = JadwalPupuk(
//               0,
//               int.parse(_dayController.text),
//               _timeController.text,
//               loggedInUser.idUser,
//             );
//             final _pemupukanProvider =
//                 Provider.of<PemupukanProvider>(
//               context,
//               listen: false,
//             );
//             _pemupukanProvider.createPemupukan(newJadwal).then((_) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                   content: Text('schedule created successfully'),
//                 ),
//               );
//             }).catchError((error) {
//               print(error);
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                     content:
//                         Text('Failed to create schedule: $error')),
//               );
//             });
//           },
//           child: Text(
//             'Tambahkan Jadwal',
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//           style: TextButton.styleFrom(
//             backgroundColor: Color(0xFF30E5D0),
//             // primary: Colors.white,
//             padding:
//                 EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20.0),
//             ),
//           ),
//         ),
//       ),
//     ],
//   ),
