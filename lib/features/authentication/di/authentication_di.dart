import 'package:chd_task_ahmed_ayman/app_injector.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/data/repository/authentication_repository_Implementation.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/domain/repository/authentication_repository.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/domain/use_cases/login_use_case.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/domain/use_cases/register_use_case.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/domain/use_cases/verify_use_case.dart';

class AuthenticationDi {
  AuthenticationDi._();

  static Future<void> initialize() async {
    injector.registerLazySingleton<AuthenticationRepository>(
            () => AuthenticationRepositoryImplementation());

    injector.registerFactory(() => LoginUseCase(injector()));
    injector.registerFactory(() => RegisterUseCase(injector()));
    injector.registerFactory(() => VerifyUseCase(injector()));
  }
}