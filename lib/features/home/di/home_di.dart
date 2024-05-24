import 'package:chd_task_ahmed_ayman/core/utils/app_injector.dart';
import 'package:chd_task_ahmed_ayman/features/home/data/repository/home_repository_implmentation.dart';
import 'package:chd_task_ahmed_ayman/features/home/domain/repository/home_repository.dart';
import 'package:chd_task_ahmed_ayman/features/home/domain/use_cases/get_home_products_use_case.dart';

class HomeDi {
  HomeDi._();

  static void initialize() {
    injector.registerLazySingleton<HomeRepository>(
        () => HomeRepositoryImplementation());

    injector.registerFactory(() => GetHomeProductsUseCase(injector()));
  }
}
