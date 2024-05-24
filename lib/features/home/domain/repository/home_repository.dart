import 'package:chd_task_ahmed_ayman/features/home/domain/models/product_model.dart';

abstract class HomeRepository
{
  Future<List<ProductModel>> getHomeProducts();
}