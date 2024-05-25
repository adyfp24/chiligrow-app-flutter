part of 'model.dart';

class OTP{
  final String email;
  final int otp;

  OTP(
    this.email,
    this.otp
  );

    Map<String, dynamic> toJson() {
    return {
      'email': email,
      'otp': otp,
    };
  }
}