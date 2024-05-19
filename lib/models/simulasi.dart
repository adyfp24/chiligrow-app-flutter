part of 'model.dart';

class Simulasi {
  final String jenisBibit;
  final int luasLahan;
  final int kuantitasPupuk;
  final int volumeAir;
  final int jumlahBibit;
  final int pupukUrea;
  final int pupukNpk;

  Simulasi(
    this.jenisBibit,
    this.luasLahan,
    this.kuantitasPupuk,
    this.jumlahBibit,
    this.volumeAir,
    this.pupukUrea,
    this.pupukNpk,
  );

  factory Simulasi.fromJson(Map<String, dynamic> json) {
    return Simulasi(
        json['jenis_bibit'] as String,
        (json['luas_lahan'] as num).toInt(),
        (json['kuantitas_pupuk'] as num).toInt(),
        (json['jumlah_bibit'] as num).toInt(),
        (json['volume_air'] as num).toInt(),
        (json['pupuk_urea'] as num).toInt(),
        (json['pupuk_npk'] as num).toInt());
  }

  Map<String, dynamic> toJson() {
    return {
      'jenis_bibit': jenisBibit,
      'luas_lahan': luasLahan,
      'kuantitas_pupuk': kuantitasPupuk,
      'jumlah_bibit': jumlahBibit,
      'volume_air': volumeAir,
      'pupuk_urea': pupukUrea,
      'pupuk_npk': pupukNpk
    };
  }
}
