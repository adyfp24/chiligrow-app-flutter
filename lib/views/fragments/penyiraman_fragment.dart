part of 'fragment.dart'; // Sesuaikan dengan path file provider Anda

class PenyiramanFragment extends StatelessWidget {
  const PenyiramanFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<SensorProvider>(context, listen: false).getDataSensor();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Penyiraman Otomatis',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
        child: Consumer<SensorProvider>(
          builder: (context, sensorProvider, _) {
            if (sensorProvider.isLoading) {
              return CircularProgressIndicator();
            } else {
              return ListView(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                children: [
                  Text(
                    'Nilai kelembapan tanah',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  Align(
                    child: Container(
                      width: 240,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('img/speedo.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '${sensorProvider.dataSensor != null ? sensorProvider.dataSensor.nilaiKelembapan.toString() : 'N/A'}',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Align(
                    child: Container(
                      width: 240,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(175, 245, 237, 1),
                      ),
                      child: Center(
                        child: Text(
                          'Kondisi tanah basah',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 110,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromRGBO(0, 133, 117, 1),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Pompa',
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'OFF',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 110,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromRGBO(0, 133, 117, 1),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Air',
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'MATI',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
