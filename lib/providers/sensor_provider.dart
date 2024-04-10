part of './provider.dart';

class SensorProvider extends ChangeNotifier {
  late ValueNotifier<Sensor> _dataSensorNotifier;
  Sensor get dataSensor => _dataSensorNotifier.value;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  SensorProvider() {
    _dataSensorNotifier = ValueNotifier(Sensor(0, 0));
  }

  ValueNotifier<Sensor> get dataSensorNotifier => _dataSensorNotifier;


  Future<void> getDataSensor() async {
    _isLoading = true;
    notifyListeners();

    final url = Uri.parse('http://localhost:4000/api/v1/sensor-data');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        final Map<String, dynamic> data= jsonResponse['data'];
        _dataSensorNotifier.value = Sensor.fromJson(data);
      } else {
        throw Exception('Failed to load sensor data');
      }
    } catch (e) {
      print('Error fetching sensor data: $e');
      throw Exception('Failed to load sensor data');
    }

    _isLoading = false;
    notifyListeners();
  }
}
