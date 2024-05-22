import 'package:chd_task_ahmed_ayman/features/authentication/data/api_register_model.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/domain/models/regiser_model.dart';

extension ApiRegisterMapper on ApiRegisterModel {
  RegisterModel mapToRegister() {
    return RegisterModel(
      message: message,
      status: status,
      otp: otp,
    );
  }
}