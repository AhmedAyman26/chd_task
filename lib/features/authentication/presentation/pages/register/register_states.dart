import 'package:chd_task_ahmed_ayman/core/utils/request_status.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/domain/models/register_model.dart';

class RegisterStates
{
  final RequestStatus registerState;
  final String errorMessage;
  final RegisterModel registerModel;

  RegisterStates(this.registerState, this.errorMessage, this.registerModel);

  RegisterStates.initial()
      : registerState = RequestStatus.initial,
        errorMessage = '',
        registerModel = RegisterModel.initial();

  RegisterStates copyWith({
    RequestStatus? registerState,
    String? errorMessage,
    RegisterModel? registerModel,
  }) =>
      RegisterStates(
        registerState ?? this.registerState,
        errorMessage ?? this.errorMessage,
        registerModel ?? this.registerModel,
      );
}