part of 'model.dart';

class RiwayatPupuk {
  final int idRiwayatPemupukan;
  final DateTime waktuPemupukan;
  final int jadwalPemupukanId;
  final JadwalPupuk jadwalPemupukan;

  RiwayatPupuk({
    required this.idRiwayatPemupukan,
    required this.waktuPemupukan,
    required this.jadwalPemupukanId,
    required this.jadwalPemupukan,
  });

  factory RiwayatPupuk.fromJson(Map<String, dynamic> json) {
    return RiwayatPupuk(
      idRiwayatPemupukan: json["id_riwayat_pemupukan"] as int,
      waktuPemupukan: DateTime.parse(json["waktu_pemupukan"] as String),
      jadwalPemupukanId: json["jadwal_pemupukan_id"] as int,
      jadwalPemupukan: JadwalPupuk.fromJson(json["jadwal_pemupukan"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id_riwayat_pemupukan": idRiwayatPemupukan,
        "waktu_pemupukan": waktuPemupukan.toIso8601String(),
        "jadwal_pemupukan_id": jadwalPemupukanId,
        "jadwal_pemupukan": jadwalPemupukan.toJson(),
      };
}
