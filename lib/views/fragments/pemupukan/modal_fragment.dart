part of '../fragment.dart';

class ModalPemupukanFragment extends StatefulWidget {
  const ModalPemupukanFragment({Key? key}) : super(key: key);

  @override
  _ModalPemupukanFragmentState createState() => _ModalPemupukanFragmentState();
}

class _ModalPemupukanFragmentState extends State<ModalPemupukanFragment> {
  late TextEditingController _dayController;
  late TextEditingController _timeController;

  @override
  void initState() {
    super.initState();
    _dayController = TextEditingController();
    _timeController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    final List<User> users = userProvider.users;
    final User loggedInUser = users.first;
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Selang Hari',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _dayController,
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                prefixIcon: Icon(Icons.calendar_view_day_sharp),
                labelText: '. . . hari sekali',
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Selang Jam',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _timeController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                prefixIcon: Icon(Icons.timer_outlined),
                labelText: 'jam : menit : detik',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_dayController.text.isEmpty ||
                    _timeController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Masukkan data dengan benar'),
                    ),
                  );
                  return;
                }

                int? selangHari;
                try {
                  selangHari = int.parse(_dayController.text);
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Masukkan data dengan benar'),
                    ),
                  );
                  return;
                }

                if (_timeController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Masukkan data dengan benar'),
                    ),
                  );
                  return;
                }

                final newJadwal = JadwalPupuk(
                  0,
                  int.parse(_dayController.text),
                  _timeController.text,
                  loggedInUser.idUser,
                );
                final _pemupukanProvider = Provider.of<PemupukanProvider>(
                  context,
                  listen: false,
                );
                _pemupukanProvider.createPemupukan(newJadwal).then((_) {
                  Navigator.pop(context);
                  homepageKey.currentState?.setSelectedIndex(2);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('jadwal berhasil dibuat'),
                    ),
                  );
                }).catchError((error) {
                  print(error);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Masukkan data dengan benar'),
                    ),
                  );
                });
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _dayController.dispose();
    _timeController.dispose();
    super.dispose();
  }
}
