part of 'model.dart';

class Sensor {
  final int idSensor;
  final int nilaiKelembapan;

  Sensor(
    this.idSensor,
    this.nilaiKelembapan,
  );

  factory Sensor.fromJson(Map<String, dynamic> json) {
    return Sensor(
      json["id_sensor"] as int,
      json["nilai_kelembapan"] as int,
    );
  }

  Map<String, dynamic> toJson() => {
        "id_sensor": idSensor,
        "nilai_kelembapan": nilaiKelembapan,
      };
}
