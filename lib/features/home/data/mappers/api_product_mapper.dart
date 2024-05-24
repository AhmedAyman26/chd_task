import 'package:chd_task_ahmed_ayman/features/home/data/models/api_product_model.dart';
import 'package:chd_task_ahmed_ayman/features/home/domain/models/product_model.dart';

extension ApiProductMapper on ApiProductModel {
  ProductModel mapToProductModel() {
    return ProductModel(id: id, name: name, description: description);
  }
}
