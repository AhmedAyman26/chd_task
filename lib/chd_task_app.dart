import 'package:chd_task_ahmed_ayman/features/authentication/presentation/pages/login/login_page.dart';
import 'package:flutter/material.dart';

class ChdTaskApp extends StatelessWidget {
  const ChdTaskApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
