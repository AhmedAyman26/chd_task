import 'package:chd_task_ahmed_ayman/core/utils/cache_helper.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/presentation/pages/login/login_page.dart';
import 'package:chd_task_ahmed_ayman/features/home/presentation/pages/main_navigator_page.dart';
import 'package:flutter/material.dart';

class ChdTaskApp extends StatefulWidget {
  const ChdTaskApp({super.key});

  @override
  State<ChdTaskApp> createState() => _ChdTaskAppState();
}

class _ChdTaskAppState extends State<ChdTaskApp> {
  String? token= CacheHelper.getData(key: 'token');

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: token==null?const LoginPage():const MainNavigatorPage(),
    );
  }
}
