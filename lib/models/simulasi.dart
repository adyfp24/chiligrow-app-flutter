part of 'model.dart';

class Simulasi {
  final int idSimulasi;
  final String jenisBibit;
  final int luasLahan;
  final int kuantitasPupuk;
  final int volumeAir;
  final int jumlahBibit;
  final int pupukUrea;
  final int pupukNpk;

  Simulasi(this.idSimulasi, this.jenisBibit, this.luasLahan,
      this.kuantitasPupuk, this.jumlahBibit, this.volumeAir, this.pupukUrea, this.pupukNpk);

  factory Simulasi.fromJson(Map<String, dynamic> json) {
    return Simulasi(
        json['id_hasil_simulasi'] as int,
        json['jenis_bibit'] as String,
        json['luas_lahan'] as int,
        json['kuantitas_pupuk'] as int,
        json['jumlah_bibit'] as int,
        json['volume_air'] as int,
        json['pupuk_urea'] as int,
        json['pupuk_npk'] as int
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_hasil_simulasi': idSimulasi,
      'jenis_bibit': jenisBibit,
      'luas_lahan': luasLahan,
      'kuantitas_pupuk': kuantitasPupuk,
      'jumlah_bibit': jumlahBibit,
      'volume_air': volumeAir,
      'pupuk_urea': pupukUrea,
      'pupuk_npk': pupukNpk,
    };
  }
}
