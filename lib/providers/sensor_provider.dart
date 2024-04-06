part of './provider.dart';

class SensorProvider extends ChangeNotifier {
  List<Sensor> _dataSensor = [];
  List<Sensor> get dataSensor => _dataSensor;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getDataSensor() async {
    _isLoading = true;
    notifyListeners();

    final url = Uri.parse('http://localhost:4000/api/v1/sensor-data');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = json.decode(response.body)['data'];
        _dataSensor =
            jsonResponse.map((data) => Sensor.fromJson(data)).toList();
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
