part of '../page.dart';

class HasilSimulasi extends StatelessWidget {
  const HasilSimulasi({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, String> data =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final luasLahan = data['luasLahan']!;
    final jumlahBibit = data['jumlahBibit']!;
    final pupukUrea = data['pupukUrea']!;
    final pupukNpk = data['pupukNpk']!;
    final volumeAir = data['volumeAir']!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Simulasi Penanaman',
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
          onPressed: () {
            homepageKey.currentState!.setSelectedIndex(0);
          },
        ),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 450,
              decoration: BoxDecoration(
                  border: Border.all(style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Container(
                    height: 40,
                    width: double.infinity,
                    color: Color.fromRGBO(175, 245, 237, 1),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Hasil Simulasi',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(height: 35),
                  _buildDetailItem(
                      Icons.task, 'Jarak tanam', '40 cm x 50cm (${luasLahan} m²)'),
                  _buildDetailItem(
                      Icons.task, 'Jumlah Bibit', '${jumlahBibit} bibit'),
                  _buildDetailItem(Icons.task, 'Kuantitas Pupuk',
                      'Pupuk Npk ${pupukNpk} Kg\nPupuk Urea ${pupukUrea} Kg'),
                  _buildDetailItem(Icons.task, 'Volume Air', '${volumeAir} Liter'),
                  SizedBox(height: 15),
                ],
              ),
            ),
            SizedBox(height: 35),
            Container(
              width: 290,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xFF30E5D0),
              ),
              child: TextButton(
                onPressed: () => Navigator.pushNamed(context, '/home'),
                child: Text(
                  'Kembali Ke Beranda',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(IconData icon, String title, String value) {
    return Padding(
      padding: EdgeInsets.only(left: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(icon),
              SizedBox(width: 20),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 7.5,
          ),
          Text(
            value,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color(0xFF30E5D0)),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
