import 'package:chd_task_ahmed_ayman/features/authentication/di/authentication_di.dart';
import 'package:get_it/get_it.dart';

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

Future<void> registerAppDependencies() async {
  AuthenticationDi.initialize();
}
