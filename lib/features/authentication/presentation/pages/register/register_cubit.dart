import 'package:chd_task_ahmed_ayman/core/utils/request_status.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/domain/models/inputs/register_input.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/domain/use_cases/register_use_case.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/presentation/pages/register/register_states.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  final RegisterUseCase _registerUseCase;

  RegisterCubit(this._registerUseCase) : super(RegisterStates.initial());

  Future<void> register(RegisterInput registerInput) async {
    try {
      emit(state.copyWith(registerState: RequestStatus.loading));
      final user = await _registerUseCase.call(registerInput);
      emit(state.copyWith(
          registerState: RequestStatus.success, registerModel: user));
    } on DioException catch (e) {
      emit(state.copyWith(
          registerState: RequestStatus.error,
          errorMessage: e.response?.data?['message']));
    } catch (e) {
      emit(state.copyWith(
          registerState: RequestStatus.error, errorMessage: (e.toString())));
    }
  }
}
