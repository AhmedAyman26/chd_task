import 'package:chd_task_ahmed_ayman/core/utils/request_status.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/domain/models/inputs/verify_input.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/domain/use_cases/verify_use_case.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/presentation/pages/verify/verify_states.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyCubit extends Cubit<VerifyStates> {
  final VerifyUseCase _verifyUseCase;
  VerifyCubit(this._verifyUseCase) : super(VerifyStates.initial());

  Future<void> verify(VerifyInput verifyInput) async {
    emit(state.copyWith(verifyStatus: RequestStatus.loading));
    try {
      final verifyResult = await _verifyUseCase.call(verifyInput);
      emit(state.copyWith(
        verifyStatus: RequestStatus.success,
        verifyModel: verifyResult,
      ));
    }
    on DioException catch (e) {
      emit(state.copyWith(verifyStatus: RequestStatus.error,errorMessage : e.response?.data['message']));
    }
    catch (e) {
      emit(state.copyWith(verifyStatus: RequestStatus.error,errorMessage : e.toString()));
    }
  }
}
