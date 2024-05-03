part of '../fragment.dart';

class ModalPemupukanFragment extends StatelessWidget {
  const ModalPemupukanFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              decoration: InputDecoration(
                  labelText: 'Selang Hari',
                  prefixIcon: Icon(Icons.edit_calendar)),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Selang Waktu',
                  prefixIcon: Icon(Icons.timer_outlined)),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
