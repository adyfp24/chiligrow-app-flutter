part of 'model.dart';

class Simulasi {
  final int idSimulasi;
  final String jenisBibit;
  final int luasLahan;
  final int kuantitasPupuk;
  final int volumeAir;
  final int jumlahBibit;
  final String jenisPupuk;

  Simulasi(this.idSimulasi, this.jenisBibit, this.luasLahan,
      this.kuantitasPupuk, this.jenisPupuk, this.jumlahBibit, this.volumeAir);

  factory Simulasi.fromJson(Map<String, dynamic> json) {
    return Simulasi(
        json['id_hasil_simulasi'] as int,
        json['jenis_bibit'] as String,
        json['luas_lahan'] as int,
        json['kuantitas_pupuk'] as int,
        json['jenis_pupuk'] as String,
        json['jumlah_bibit'] as int,
        json['debit_air'] as int
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_hasil_simulasi': idSimulasi,
      'jenis_bibit': jenisBibit,
      'luas_lahan': luasLahan,
      'kuantitas_pupuk': kuantitasPupuk,
      'jenis_pupuk': jenisPupuk,
      'jumlah_bibit': jumlahBibit,
      'debit_air': volumeAir,
    };
  }
}
