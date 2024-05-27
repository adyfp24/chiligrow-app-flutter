part of 'provider.dart';

class PemupukanProvider extends ChangeNotifier {
  late final PemupukanService _pemupukanService;
  JadwalPupuk? _jadwalPupuk;
  JadwalPupuk? get jadwalPupuk => _jadwalPupuk;
  PemupukanProvider(this._pemupukanService);

  List<RiwayatPupuk>? _riwayatPupuk;
  List<RiwayatPupuk>? get riwayatPupuk => _riwayatPupuk;

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
        final data =
            await _pemupukanService.createPemupukan(storedToken, newJadwal);
        _jadwalPupuk = data;
        print(_jadwalPupuk);
      }
    } catch (e) {
      print('Error adding jadwal: $e');
      throw Exception('internal server eror $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> getPemupukanData() async {
    _isLoading = true;
    notifyListeners();

    try {
      final storedToken = await _secureStorage.read(key: 'token');
      if (storedToken != null) {
        final data = await _pemupukanService.getPemupukanData(storedToken);
        _jadwalPupuk = data;
        print(_jadwalPupuk);
      }
    } catch (e) {
      print('Error get jadwal: $e');
      throw Exception('internal server eror');
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> updateJadwal(int idJadwal, JadwalPupuk updatedJadwal) async {
    _isLoading = true;
    notifyListeners();

    try {
      final storedToken = await _secureStorage.read(key: 'token');
      if (storedToken != null) {
        final data = await _pemupukanService.updatePemupukanData(
            storedToken, idJadwal, updatedJadwal);
        _jadwalPupuk = data;
        print(_jadwalPupuk);
      }
    } catch (e) {
      print('Error updating jadwal: $e');
      throw Exception('internal server eror');
    }

    _isLoading = true;
    notifyListeners();
  }

  Future<void> deleteJadwal(int idJadwal) async {
    _isLoading = true;
    notifyListeners();
    try {
      final storedToken = await _secureStorage.read(key: 'token');
      if (storedToken != null) {
        final deletedJadwal =
            await _pemupukanService.deletePemupukanData(idJadwal, storedToken);
        _jadwalPupuk = null;
      }
    } catch (e) {
      print('Error when delete jadwal: $e');
      throw Exception('internal server eror');
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> clearData() async {
    _jadwalPupuk = null;
    notifyListeners();
  }

  Future<void> getAllHistory() async {
    _isLoading = true;
    notifyListeners();
    try {
      final storedToken = await _secureStorage.read(key: 'token');
      if (storedToken != null) {
        print('Stored token: $storedToken');
        final data = await _pemupukanService.getHistoryData(storedToken);
        _riwayatPupuk = data;
      } else {
        print('Token not found in secure storage');
        throw Exception('Token not found');
      }
    } catch (e) {
      print('Error when get history pemupukan: $e');
      throw Exception('Internal server error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
