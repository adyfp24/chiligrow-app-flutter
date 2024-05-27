part of 'service.dart';

class PemupukanService {
  Future<JadwalPupuk> createPemupukan(
      String token, JadwalPupuk newJadwal) async {
    final url = Uri.parse('${ApiHelper.baseUrl}/jadwal-pemupukan');
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

  Future<JadwalPupuk> updatePemupukanData(
      String token, int idJadwal, JadwalPupuk updatedJadwal) async {
    final url = Uri.parse('${ApiHelper.baseUrl}/jadwal-pemupukan/$idJadwal');
    try {
      final response = await http.put(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(updatedJadwal)
      );
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body)['data'];
        final jadwalPupuk =
            JadwalPupuk.fromJson(responseData); // Konversi ke JadwalPupuk
        print(responseData);
        return jadwalPupuk;
      } else {
        throw Exception('gagal mengupdate jadwal pemupukan');
      }
    } catch (e) {
      throw Exception('internal server eror');
    }
  }

  Future<JadwalPupuk> getPemupukanData(String token) async {
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

  Future<void> deletePemupukanData(int idJadwal, String token) async {
    final url = Uri.parse('${ApiHelper.baseUrl}/jadwal-pemupukan/$idJadwal');
    try {
      final response = await http.delete(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body)['data'];
        return responseData;
      } else {
        throw Exception('gagal menghapus jadwal pemupukan');
      }
    } catch (e) {
      print('Error delete jadwal: $e');
      throw Exception('internal server eror $e');
    }
  }

  Future<List<RiwayatPupuk>> getHistoryData(String token) async {
  final url = Uri.parse('${ApiHelper.baseUrl}/riwayat-pemupukan');
  try {
    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body)['data'] as List;
      final riwayatPupuk = responseData.map((json) => RiwayatPupuk.fromJson(json)).toList();
      print(responseData);
      return riwayatPupuk;
    } else {
      throw Exception('Gagal mendapat history pemupukan');
    }
  } catch (e) {
    print('Error get history pemupukan: $e');
    throw Exception('Internal server error $e');
  }
}

}
