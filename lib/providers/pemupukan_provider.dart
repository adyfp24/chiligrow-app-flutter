part of 'provider.dart';

class PemupukanProvider extends ChangeNotifier {
  late final PemupukanService _pemupukanService;
  late final JadwalPupuk _jadwalPupuk;
  JadwalPupuk get jadwalPupuk => _jadwalPupuk;
  PemupukanProvider(this._pemupukanService);

   

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  String? _token;
  String? get token => _token;

  Future<void> createPemupukan(JadwalPupuk newJadwal) async {
    _isLoading = true;
    notifyListeners();

    try {
      final storedToken = await _secureStorage.read(key: 'token');
      if (storedToken != null) {
        final data = await _pemupukanService.createPemupukan(storedToken, newJadwal);
        print('${data}');
      }
    } catch (e) {
      print('Error adding jadwal: $e');
      throw Exception('internal server eror');
    }

    _isLoading = false;
    notifyListeners();
  }
}
