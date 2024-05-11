part of 'fragment.dart';

class PemupukanFragment extends StatefulWidget {
  const PemupukanFragment({Key? key}) : super(key: key);

  @override
  State<PemupukanFragment> createState() => _PemupukanFragmentState();
}

class _PemupukanFragmentState extends State<PemupukanFragment>
    with TickerProviderStateMixin {
  late TabController _tabBarController;
  late TextEditingController _dayController;
  late TextEditingController _timeController;
  late PemupukanProvider _pemupukanProvider;

  @override
  void initState() {
    super.initState();
    _dayController = TextEditingController();
    _timeController = TextEditingController();
    _pemupukanProvider = Provider.of<PemupukanProvider>(context, listen: false);
    _tabBarController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _pemupukanProvider.getPemupukanData(),
      builder: (context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return _buildPemupukanFragment();
        }
      },
    );
  }

  Widget _buildPemupukanFragment() {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pemupukan Otomatis',
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
          onPressed: () => homepageKey.currentState!.setSelectedIndex(0),
        ),
        elevation: 0,
        bottom: _pemupukanProvider.jadwalPupuk != null
            ? TabBar(
                labelColor: Color.fromRGBO(0, 133, 117, 1),
                unselectedLabelColor: Colors.white,
                indicatorColor: Color.fromRGBO(0, 133, 117, 1),
                labelPadding: EdgeInsets.only(bottom: 10),
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Text('Data Jadwal'),
                  Text('History'),
                ],
                controller: _tabBarController,
              )
            : null,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_pemupukanProvider.jadwalPupuk == null) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: PemupukanEmptyFragment(),
      );
    } else {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: TabBarView(
          children: <Widget>[
            JadwalPemupukan(
              selangHari: _pemupukanProvider.jadwalPupuk!.selangHari,
              selangJam: _pemupukanProvider.jadwalPupuk!.selangJam,
            ),
            HistoryPemupukanFragment(),
          ],
          controller: _tabBarController,
        ),
      );
    }
  }
}
