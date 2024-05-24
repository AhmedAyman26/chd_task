import 'package:chd_task_ahmed_ayman/core/utils/app_injector.dart';
import 'package:chd_task_ahmed_ayman/core/chd_task_app.dart';
import 'package:chd_task_ahmed_ayman/core/utils/cache_helper.dart';
import 'package:chd_task_ahmed_ayman/core/utils/dio_helper.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  await DioHelper.init();
  await CacheHelper.init();
  runApp(const ChdTaskApp());
}
