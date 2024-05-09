part of 'fragment.dart';

class SimulasiFragment extends StatelessWidget {
  const SimulasiFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _lahanController = TextEditingController();
    TextEditingController _bibitController = TextEditingController();

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
          onPressed: () => {homepageKey.currentState!.setSelectedIndex(0)},
        ),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            Image(
              image: AssetImage('assets/img/regist-img.png'),
              height: 250,
              width: 150,
            ),
            Container(
              width: 300,
              height: 230,
              decoration: BoxDecoration(
                  border: Border.all(style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Container(
                      height: 40,
                      width: double.infinity,
                      color: Color.fromRGBO(175, 245, 237, 1),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Masukkan Data',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    child: Column(
                      children: [
                        TextField(
                          controller: _lahanController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelText: 'Luas lahan'),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: _bibitController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelText: 'Jenis bibit'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return ModalPemupukanFragment();
                  },
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.nature), // Icon tanaman
                  SizedBox(width: 8), // Jarak antara ikon dan teks
                  Text(
                    'Lihat',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              style: TextButton.styleFrom(
                elevation: 1,
                backgroundColor: Color.fromRGBO(175, 245, 237, 1),
                // primary: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 110),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
