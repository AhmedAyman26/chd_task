import 'package:chd_task_ahmed_ayman/app_injector.dart';
import 'package:chd_task_ahmed_ayman/chd_task_app.dart';
import 'package:chd_task_ahmed_ayman/core/utils/dio_helper.dart';
import 'package:flutter/material.dart';

void main() async{
  await initializeDependencies();
  await DioHelper.init();
  runApp(const ChdTaskApp());
}

