import 'package:bloc/bloc.dart';
import 'package:chd_task_ahmed_ayman/core/utils/request_status.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/domain/models/inputs/login_input.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/domain/use_cases/login_use_case.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/presentation/pages/login/login_states.dart';


class LoginCubit extends Cubit<LoginStates> {
  final LoginUseCase _loginUseCase;

  LoginCubit( this._loginUseCase) : super(LoginStates.initial());


  Future<void> login(LoginModel loginModel) async {
    try {
      emit(state.copyWith(loginState: RequestStatus.loading));
      await _loginUseCase.call(loginModel);
      emit(state.copyWith(loginState: RequestStatus.success));
    } catch (e) {
      emit(state.copyWith(loginState: RequestStatus.error, errorMessage: e.toString()));
    }
  }

}
