part of '../fragment.dart';

class RiwayatPemupukanFragment extends StatefulWidget {
  const RiwayatPemupukanFragment({Key? key}) : super(key: key);

  @override
  _RiwayatPemupukanFragmentState createState() =>
      _RiwayatPemupukanFragmentState();
}

class _RiwayatPemupukanFragmentState extends State<RiwayatPemupukanFragment> {
  late PemupukanProvider _pemupukanProvider;

  @override
  void initState() {
    super.initState();
    _pemupukanProvider = Provider.of<PemupukanProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _pemupukanProvider.getAllHistory(),
      builder: (context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Terjadi kesalahan: ${snapshot.error}'),
          );
        } else {
          return _buildHistoryPemupukanFragment();
        }
      },
    );
  }

  Widget _buildHistoryPemupukanFragment() {
    final riwayatPupukList = _pemupukanProvider.riwayatPupuk ?? [];
    if (riwayatPupukList.isEmpty) {
      return Center(child: Text('Tidak ada data riwayat pemupukan'));
    }
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
            top: 16.0), // Menambahkan jarak di bagian atas
        child: ListView.builder(
          itemCount: riwayatPupukList.length,
          itemBuilder: (context, index) {
            final riwayat = riwayatPupukList[index];
            final String tanggalPemupukan =
                riwayat.waktuPemupukan.substring(0, 10);
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: Kgreen3,
                    width: 2,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pemupukan ke-${index + 1} telah dilakukan',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Pukul: ${riwayat.jadwalPemupukan.selangJam}',
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Tanggal: ${tanggalPemupukan}',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
