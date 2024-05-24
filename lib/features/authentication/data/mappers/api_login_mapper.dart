import 'package:chd_task_ahmed_ayman/features/authentication/api_login_response.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/domain/models/login_model.dart';

extension ApiLoginMapper on ApiLoginResponse {
  LoginModel mapToLoginModel() {
    return LoginModel(message: message ?? '', otp: otp ?? 0);
  }
}
