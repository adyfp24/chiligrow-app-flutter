part of '../fragment.dart';

class JadwalPemupukan extends StatelessWidget {
  final int selangHari;
  final String selangJam;
  const JadwalPemupukan({
    Key? key,
    required this.selangHari,
    required this.selangJam,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _pemupukanProvider =
        Provider.of<PemupukanProvider>(context, listen: false);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 40),
            width: 300,
            decoration: BoxDecoration(
                border: Border.all(style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                Container(
                  height: 40,
                  width: double.infinity,
                  color: Color.fromRGBO(175, 245, 237, 1),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Kalender Pupuk',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 35),
                Container(
                  width: 250,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.calendar_today),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'setiap ${selangHari} hari',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.av_timer_outlined),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            '${selangJam} WIB',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      TextButton(
                        onPressed: () {
                          final idJadwal =
                              _pemupukanProvider.jadwalPupuk!.idJadwalPupuk;
                          _pemupukanProvider.deleteJadwal(idJadwal).then((_) {
                            _pemupukanProvider.getPemupukanData();
                            homepageKey.currentState?.setSelectedIndex(2);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('jadwal berhasil dihapus'),
                              ),
                            );
                          }).catchError((error) {
                            print(error);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(
                                      'gagal menghapus jadwal: $error')),
                            );
                          });
                          ;
                        },
                        child: Align(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.delete, color: Colors.white),
                              SizedBox(width: 5),
                              Text(
                                'Hapus',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.red[300],
                          // primary: Colors.white,
                          padding:
                              EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return UpdateModal(
                                selangHari: selangHari,
                                selangJam: selangJam,
                              );
                            },
                          );
                        },
                        child: Align(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.update_rounded, color: Colors.white),
                              SizedBox(width: 5),
                              Text(
                                'Ubah',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Color.fromRGBO(0, 133, 117, 1),
                          // primary: Colors.white,
                          padding:
                              EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
