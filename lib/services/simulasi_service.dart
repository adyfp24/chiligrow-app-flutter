part of 'service.dart';

class SimulasiService {
  final url = Uri.parse('${ApiHelper.baseUrl}/simulasi');
  Future<Simulasi> createSimulasi( String token, Simulasi newSimulasi) async {
    try {
      final response = await http.post(
        url, 
        headers: ApiHelper.getHeaders(token),
        body: jsonEncode(newSimulasi)
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        final Map<String, dynamic> data = jsonResponse['data'];
        print(jsonResponse);
        final simulasiData = Simulasi.fromJson(data);
        return simulasiData;
      } else {
        throw Exception(
            'Failed to fetch simulasi data: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error when create simulasi: $e');
      throw Exception('internal server eror');
    }
  }
}
