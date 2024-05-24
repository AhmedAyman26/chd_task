import 'package:chd_task_ahmed_ayman/core/utils/cache_helper.dart';
import 'package:chd_task_ahmed_ayman/core/utils/dio_helper.dart';
import 'package:chd_task_ahmed_ayman/features/home/data/mappers/api_product_mapper.dart';
import 'package:chd_task_ahmed_ayman/features/home/data/models/api_product_model.dart';
import 'package:chd_task_ahmed_ayman/features/home/domain/models/product_model.dart';
import 'package:chd_task_ahmed_ayman/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImplementation extends HomeRepository {
  @override
  Future<List<ProductModel>> getHomeProducts() async {
    final response = await DioHelper.getData(
        token: CacheHelper.getData(key: 'token'), url: 'product');
    if (response.statusCode == 200) {
      return List<ProductModel>.from((response.data['produtcs']).map(
              (e) => ApiProductModel.fromJson(response.data).mapToProductModel))
          .toList();
    } else {
      throw Exception(response.data['message']);
    }
  }
}
