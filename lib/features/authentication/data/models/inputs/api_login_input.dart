import 'package:chd_task_ahmed_ayman/features/authentication/domain/models/inputs/login_input.dart';

class ApiLoginInput {
  final String phone;
  final String dial_code;
  final String identity;

  ApiLoginInput(this.phone, this.dial_code, this.identity);

  factory ApiLoginInput.fromInput(LoginInput loginInput) {
    return ApiLoginInput(
        loginInput.phone, loginInput.dialCode, loginInput.identity);
  }

  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'dial_code': dial_code,
      'identity': identity,
    };
  }
}
