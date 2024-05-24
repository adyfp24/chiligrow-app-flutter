part of '../fragment.dart';

class UpdateModal extends StatefulWidget {
  final int selangHari;
  final String selangJam;

  const UpdateModal({
    required this.selangHari,
    required this.selangJam,
    Key? key,
  }) : super(key: key);

  @override
  State<UpdateModal> createState() => _UpdateModalState();
}

class _UpdateModalState extends State<UpdateModal> {
  late TextEditingController _dayController;
  late TextEditingController _timeController;

  @override
  void initState() {
    super.initState();
    _dayController = TextEditingController(text: widget.selangHari.toString());
    _timeController = TextEditingController(text: widget.selangJam);
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final users = userProvider.users;
    final loggedInUser = users.first;

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              controller: _dayController,
              decoration: InputDecoration(
                labelText: 'Selang Hari',
                prefixIcon: Icon(Icons.app_registration_outlined),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _timeController,
              decoration: InputDecoration(
                labelText: 'Selang Jam',
                prefixIcon: Icon(Icons.calendar_view_day_sharp),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final _pemupukanProvider = Provider.of<PemupukanProvider>(
                  context,
                  listen: false,
                );

                final updatedJadwal = JadwalPupuk(
                  _pemupukanProvider.jadwalPupuk!.idJadwalPupuk,
                  int.parse(_dayController.text),
                  _timeController.text,
                  loggedInUser.idUser,
                );


                _pemupukanProvider
                    .updateJadwal(updatedJadwal.idJadwalPupuk, updatedJadwal)
                    .then((_) {
                  Navigator.pop(context);
                  homepageKey.currentState?.setSelectedIndex(2);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Jadwal pupuk berhasil diupdate'),
                    ),
                  );
                }).catchError((error) {
                  print(error);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Gagal memperbarui jadwal: $error'),
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
