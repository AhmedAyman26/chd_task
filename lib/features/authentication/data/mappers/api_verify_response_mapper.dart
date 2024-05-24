import 'package:chd_task_ahmed_ayman/features/authentication/data/models/api_verify_model.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/domain/models/verify_model.dart';

extension ApiVerifyResponseMapper on ApiVerifyResponse {
  VerifyModel mapToVerify() {
    return VerifyModel(
      message: message,
      token: accessToken,
    );
  }
}
