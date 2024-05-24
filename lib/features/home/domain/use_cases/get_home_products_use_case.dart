import 'package:chd_task_ahmed_ayman/features/home/domain/models/product_model.dart';
import 'package:chd_task_ahmed_ayman/features/home/domain/repository/home_repository.dart';

class GetHomeProductsUseCase
{
  final HomeRepository _homeRepository;

  GetHomeProductsUseCase(this._homeRepository);

  Future<List<ProductModel>> call()
  async {
    return await _homeRepository.getHomeProducts();
  }
}