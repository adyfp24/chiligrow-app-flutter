part of 'service.dart';

class PemupukanService {
  final String baseUrl = 'http://localhost:4000/api/v1';

  Future<JadwalPupuk> createPemupukan(
      String token, JadwalPupuk newJadwal) async {
    final url = Uri.parse('${ApiHelper.baseUrl}/jadwal-pemupukan');
    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Aucvthorization': 'Bearer $token',
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

  Future<JadwalPupuk> getPemupukanData (String token) async {
    final url = Uri.parse('${ApiHelper.baseUrl}/jadwal-pemupukan');
    try {
      final response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body)['data'];
        final jadwalPupuk =
            JadwalPupuk.fromJson(responseData); // Konversi ke JadwalPupuk
        print(responseData);
        return jadwalPupuk;
      } else {
        throw Exception('gagal mendapatkan jadwal pemupukan');
      }
    } catch (e) {
      print('Error get jadwal: $e');
      throw Exception('internal server eror');
    }
  }
}
