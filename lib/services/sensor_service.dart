part of './service.dart';

class SensorService { 

  Future<Sensor> fetchSensorData() async {
    final url = Uri.parse('${ApiHelper.baseUrl}/sensor-data');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        final Map<String, dynamic> data = jsonResponse['data'];
        final sensorData = Sensor.fromJson(data);
        return sensorData;
      } else {
        throw Exception('Failed to fetch sensor data: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error fetching sensor data: $e');
      throw Exception('Failed to fetch sensor data');
    }
  }
}
