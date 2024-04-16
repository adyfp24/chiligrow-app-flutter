part of 'model.dart';

class JadwalPupuk {
  final int idJadwalPupuk;
  final int selangHari;
  final String selangJam;
  final int userId;

  JadwalPupuk(
    this.idJadwalPupuk,
    this.selangHari,
    this.selangJam,
    this.userId,
); 

  factory JadwalPupuk.fromJson(Map<String, dynamic> json) {
    return JadwalPupuk(
      json["id_jadwal_pemupukan"] as int,
      json["selang_hari"] as int,
      json["selang_jam"] as String,
      json["user_id"] as int,
    );
  }

  Map<String, dynamic> toJson() => {
        "id_jadwal_pemupukan": idJadwalPupuk,
        "selang_hari": selangHari,
        "selang_jam": selangJam,
        "user_id": userId,
      };
}
