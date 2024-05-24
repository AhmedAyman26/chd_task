import 'package:chd_task_ahmed_ayman/core/utils/request_status.dart';
import 'package:chd_task_ahmed_ayman/features/home/domain/models/product_model.dart';

class HomeStates {
  final RequestStatus getProductsState;
  final List<ProductModel> homeProducts;
  final String errorMessage;

  HomeStates(this.getProductsState, this.homeProducts, this.errorMessage);

  HomeStates.initial() : this(RequestStatus.initial, [], '');

  HomeStates copyWith({RequestStatus? getProductsState,
      List<ProductModel>? homeProducts, String? errorMessage}) {
    return HomeStates(getProductsState ?? this.getProductsState,
        homeProducts ?? this.homeProducts, errorMessage ?? this.errorMessage);
  }
}
