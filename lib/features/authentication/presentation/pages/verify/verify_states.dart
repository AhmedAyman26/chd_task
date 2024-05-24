import 'package:chd_task_ahmed_ayman/core/utils/request_status.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/domain/models/verify_model.dart';

class VerifyStates
{
  final RequestStatus? verifyStatus;
  final VerifyModel ? verifyModel;
  final String? errorMessage;
  VerifyStates({this.verifyStatus, this.verifyModel, this.errorMessage});

  VerifyStates.initial():this(verifyStatus: RequestStatus.initial,verifyModel: null,errorMessage: '');

  VerifyStates copyWith({RequestStatus? verifyStatus, VerifyModel? verifyModel, String? errorMessage})
  {
    return VerifyStates(
      errorMessage: errorMessage ?? this.errorMessage,
      verifyStatus: verifyStatus ?? this.verifyStatus,
        verifyModel: verifyModel ?? this.verifyModel
    );
  }
}