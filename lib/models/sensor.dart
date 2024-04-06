import 'dart:convert';

class Sensor{
  final int idSensor;
  final String nilaiKelembapan;

  Sensor(this.idSensor, this.nilaiKelembapan);

  factory Sensor.fromJson(Map<String, dynamic> json) {
    return Sensor(
      json["id_podcast"] as int,
      json["judul_podcast"] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        "id_sensor": idSensor,
        "nilai_kelembapan": nilaiKelembapan,
      };
}