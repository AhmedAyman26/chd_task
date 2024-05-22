import 'package:chd_task_ahmed_ayman/features/authentication/domain/models/inputs/login_input.dart';

class ApiLoginInput {
  final int phone;
  final String dial_code;
  final String identity;

  ApiLoginInput(this.phone, this.dial_code, this.identity);

  factory ApiLoginInput.fromInput(LoginModel loginModel) {
    return ApiLoginInput(
        loginModel.phone, loginModel.dialCode, loginModel.identity);
  }

  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'dial_code': dial_code,
      'identity': identity,
    };
  }
}
