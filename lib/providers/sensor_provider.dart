part of './provider.dart';

class SensorProvider extends ChangeNotifier {
  late final SensorService _sensorService;

  late ValueNotifier<Sensor> _dataSensorNotifier;
  Sensor get dataSensor => _dataSensorNotifier.value;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  SensorProvider(this._sensorService) {
    _dataSensorNotifier = ValueNotifier(Sensor(0, 0));
  }

  ValueNotifier<Sensor> get dataSensorNotifier => _dataSensorNotifier;

  Future<void> getDataSensor() async {
    _isLoading = true;
    notifyListeners();

    try {
      final sensorData = await _sensorService.fetchSensorData();
      _dataSensorNotifier.value = sensorData;
    } catch (e) {
      print('Error fetching sensor data: $e');
      throw Exception('Failed to load sensor data');
    }

    _isLoading = false;
    notifyListeners();
  }
}
