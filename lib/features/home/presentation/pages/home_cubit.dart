import 'package:chd_task_ahmed_ayman/core/utils/request_status.dart';
import 'package:chd_task_ahmed_ayman/features/home/domain/use_cases/get_home_products_use_case.dart';
import 'package:chd_task_ahmed_ayman/features/home/presentation/pages/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  final GetHomeProductsUseCase _getHomeProductsUseCase;

  HomeCubit(this._getHomeProductsUseCase) : super(HomeStates.initial());

  Future<void> getHomeProducts() async {
    emit(state.copyWith(getProductsState: RequestStatus.loading));
    try {
      final products = await _getHomeProductsUseCase.call();
      emit(state.copyWith(
          getProductsState: RequestStatus.success, homeProducts: products));
    } catch (e) {
      emit(state.copyWith(
          getProductsState: RequestStatus.error, errorMessage: e.toString()));
    }
  }
}
