part of 'service.dart';

class SimulasiService{
  final url = Uri.parse('${ApiHelper.baseUrl}/sensor-data');
  Future<Simulasi> createSimulasi (Simulasi newSimulasi) async {
    try{
     final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        final Map<String, dynamic> data = jsonResponse['data'];
        final simulasiData = Simulasi.fromJson(data);
        return simulasiData;
      } else {
        throw Exception('Failed to fetch simulasi data: ${response.reasonPhrase}');
      }
    }catch(e){
      print('Error when create simulasi: $e');
      throw Exception('internal server eror');
    }
  }
}