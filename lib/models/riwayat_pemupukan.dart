part of 'model.dart';

class RiwayatPupuk {
  final int idRiwayatPemupukan;
  final String waktuPemupukan;
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
      idRiwayatPemupukan: json["id_riwayat_pemupukan"] ?? 0,
      waktuPemupukan: json["waktu_pemupukan"] ?? '',
      jadwalPemupukanId: json["jadwal_pemupukan_id"] ?? 0,
      jadwalPemupukan: json["jadwal_pemupukan"] != null 
          ? JadwalPupuk.fromJson(json["jadwal_pemupukan"])
          : JadwalPupuk(0, 0, '', 0),
    );
  }

  Map<String, dynamic> toJson() => {
        "id_riwayat_pemupukan": idRiwayatPemupukan,
        "waktu_pemupukan": waktuPemupukan,
        "jadwal_pemupukan_id": jadwalPemupukanId,
        "jadwal_pemupukan": jadwalPemupukan.toJson(),
      };
}

