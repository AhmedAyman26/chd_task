import 'package:chd_task_ahmed_ayman/core/utils/request_status.dart';

class LoginStates
{
  final RequestStatus loginState;
  final String errorMessage;

  LoginStates(this.loginState, this.errorMessage);

  LoginStates.initial() : loginState = RequestStatus.initial, errorMessage = '';

  LoginStates copyWith({RequestStatus? loginState, String? errorMessage})
  {
    return LoginStates(loginState ?? this.loginState, errorMessage ?? this.errorMessage);
  }
}