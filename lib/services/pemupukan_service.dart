part of 'service.dart';

class PemupukanService {
  final String baseUrl = 'http://localhost:4000/api/v1';

  Future<JadwalPupuk> createPemupukan(
      String token, JadwalPupuk newJadwal) async {
    final url = Uri.parse('$baseUrl/jadwal-pemupukan');
    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(newJadwal),
      );
      if (response.statusCode == 201) {
        final responseData = json.decode(response.body)['data'];
        final jadwalPupuk =
            JadwalPupuk.fromJson(responseData); // Konversi ke JadwalPupuk
        return jadwalPupuk;
      } else {
        throw Exception('gagal menambahkan jadwal pemupukan');
      }
    } catch (e) {
      print('Error adding jadwal: $e');
      throw Exception('internal server eror');
    }
  }
}
