import 'package:bloc/bloc.dart';
import 'package:chd_task_ahmed_ayman/core/utils/request_status.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/domain/models/inputs/login_input.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/domain/use_cases/login_use_case.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/presentation/pages/login/login_states.dart';


class LoginCubit extends Cubit<LoginStates> {
  final LoginUseCase _loginUseCase;

  LoginCubit( this._loginUseCase) : super(LoginStates.initial());


  Future<void> login(LoginInput loginInput) async {
    try {
      emit(state.copyWith(loginState: RequestStatus.loading));
      final loginResponse= await _loginUseCase.call(loginInput);
      emit(state.copyWith(loginState: RequestStatus.success,loginResponse: loginResponse));
    } catch (e) {
      emit(state.copyWith(loginState: RequestStatus.error, errorMessage: e.toString()));
    }
  }

}
