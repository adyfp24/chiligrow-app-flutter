part of 'fragment.dart';

class SimulasiFragment extends StatefulWidget {
  const SimulasiFragment({Key? key}) : super(key: key);

  @override
  _SimulasiFragmentState createState() => _SimulasiFragmentState();
}

class _SimulasiFragmentState extends State<SimulasiFragment> {
  String? _selectedBibit;
  TextEditingController _lahanController = TextEditingController();
  TextEditingController _bibitController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 255,
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
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
                        DropdownButtonFormField<String>(
                          value: _selectedBibit,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedBibit =
                                  newValue; // Menyimpan nilai pilihan bibit
                            });
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            labelText: 'Jenis bibit',
                          ),
                          items: <String>[
                            'Bibit Cabai Merah',
                            'Bibit Cabai Rawit'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            TextButton(
              onPressed: () => {
                Navigator.pushNamed(context, '/hasil-simulasi')
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.nature),
                  SizedBox(width: 8),
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
