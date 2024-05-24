import 'package:chd_task_ahmed_ayman/features/authentication/domain/models/inputs/verify_input.dart';

class ApiVerifyInput {
  final String identity;
  final String phone;
  final String otp;
  final String fcm_token;

  ApiVerifyInput(this.identity, this.phone, this.otp, this.fcm_token);

  ApiVerifyInput.fromInput(VerifyInput verifyInput)
    : identity = verifyInput.identity,
    phone = verifyInput.phoneNumber,
    otp = verifyInput.otp,
    fcm_token = verifyInput.fcmToken;

  Map<String, dynamic> toJson() => {
    'identity': identity,
    'phone': phone,
    'otp': otp,
    'fcm_token': fcm_token
  };
}