part of '../fragment.dart';

class PemupukanEmptyFragment extends StatelessWidget {
  const PemupukanEmptyFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/img/eco.png'), fit: BoxFit.cover)),
          ),
          SizedBox(height: 10),
          Text('Belum ada jadwal pemupukan'),
          SizedBox(height: 60),
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ModalPemupukanFragment();
                },
              );
            },
            child: Text(
              '+ Tambah',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            style: TextButton.styleFrom(
              backgroundColor: Color(0xFF30E5D0),
              // primary: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
