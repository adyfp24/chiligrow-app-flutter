part of './provider.dart';

class SimulasiProvider extends ChangeNotifier{
  SimulasiService _simulasiService = SimulasiService();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Simulasi? _simulasiPenanaman;
  Simulasi? get simulasiPenanaman => _simulasiPenanaman;

  Future<void> createSimulasi(Simulasi newSimulasi) async {
    _isLoading = true;
    notifyListeners();
    try {
      final responseData = await _simulasiService.createSimulasi(newSimulasi);
      _simulasiPenanaman = responseData;
    } catch (e) {
      print('Error fetching simulasi data: $e');
      throw Exception('Failed to load simulasi data');
    }
    _isLoading = false;
    notifyListeners();
  }
}
