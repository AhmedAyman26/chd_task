import 'package:chd_task_ahmed_ayman/core/utils/request_status.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/domain/models/login_model.dart';

class LoginStates {
  final RequestStatus? loginState;
  final LoginModel? loginResponse;
  final String? errorMessage;

  LoginStates({this.loginState, this.errorMessage,this.loginResponse});

  LoginStates.initial() : this(loginState :RequestStatus.initial, errorMessage:'',loginResponse: null);

  LoginStates copyWith({RequestStatus? loginState, String? errorMessage,LoginModel? loginResponse})
  {
  return LoginStates(loginState: loginState ?? this.loginState,errorMessage:  errorMessage ?? this.errorMessage,loginResponse: loginResponse??this.loginResponse);
  }
}