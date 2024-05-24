import 'package:chd_task_ahmed_ayman/features/authentication/di/authentication_di.dart';
import 'package:chd_task_ahmed_ayman/features/home/di/home_di.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {

  injector.pushNewScope();
  await registerAppDependencies();
}

//TODO:use this func with AuthLogout func to resetScope. don't forget.
Future<void> resetScopeDependencies() async {
  await injector.resetScope();
  await registerAppDependencies();
}

final sharedPreferences =  SharedPreferences.getInstance();
Future<void> registerAppDependencies() async {
  injector.registerLazySingleton<Future<SharedPreferences>>(() =>sharedPreferences);
  AuthenticationDi.initialize();
  HomeDi.initialize();
}
