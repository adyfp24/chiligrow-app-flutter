part of 'fragment.dart';

class PemupukanFragment extends StatefulWidget {
  const PemupukanFragment({Key? key}) : super(key: key);

  @override
  State<PemupukanFragment> createState() => _PemupukanFragmentState();
}

class _PemupukanFragmentState extends State<PemupukanFragment> {
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
  }

  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    final List<User> users = userProvider.users;
    if (users.isEmpty) {
      return Center(child: CircularProgressIndicator());
    }
    final User loggedInUser = users.first;
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: _pemupukanProvider.jadwalPupuk == null
            ? Text('belum ada data jadwal')
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('get data pemupukan'),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      'selang hari : ${_pemupukanProvider.jadwalPupuk?.selangHari}'),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      'setiap jam : ${_pemupukanProvider.jadwalPupuk?.selangJam}'),
                  SizedBox(
                    height: 20,
                  ),
                  Text('tambah jadwal pemupukan'),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _dayController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        prefixIcon: Icon(Icons.youtube_searched_for_outlined),
                        labelText: 'Selang Hari'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _timeController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        prefixIcon: Icon(Icons.schedule),
                        labelText: 'Waktu Pemupukan'),
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: TextButton(
                      onPressed: () {
                        final newJadwal = JadwalPupuk(
                          0,
                          int.parse(_dayController.text),
                          _timeController.text,
                          loggedInUser.idUser,
                        );
                        final _pemupukanProvider =
                            Provider.of<PemupukanProvider>(
                          context,
                          listen: false,
                        );
                        _pemupukanProvider.createPemupukan(newJadwal).then((_) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('schedule created successfully'),
                            ),
                          );
                        }).catchError((error) {
                          print(error);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content:
                                    Text('Failed to create schedule: $error')),
                          );
                        });
                      },
                      child: Text(
                        'Tambahkan Jadwal',
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
    );
  }
}
