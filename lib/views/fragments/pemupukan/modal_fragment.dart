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
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Jenis Pupuk',
                  prefixIcon: Icon(Icons.app_registration_outlined)),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _dayController,
              decoration: InputDecoration(
                  labelText: 'Selang Hari',
                  prefixIcon: Icon(Icons.calendar_view_day_sharp)),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _timeController,
              decoration: InputDecoration(
                  labelText: 'Selang Waktu',
                  prefixIcon: Icon(Icons.timer_outlined)),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
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
                      content: Text('schedule created successfully'),
                    ),
                  );
                }).catchError((error) {
                  print(error);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text('Failed to create schedule: $error')),
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
