import 'package:chd_task_ahmed_ayman/features/authentication/domain/models/inputs/login_input.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/domain/models/inputs/register_input.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/domain/models/inputs/verify_input.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/domain/models/login_model.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/domain/models/register_model.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/domain/models/verify_model.dart';

abstract class AuthenticationRepository {
  Future<LoginModel> login(LoginInput loginInput);
  Future<RegisterModel> register(RegisterInput registerInput);
  Future<VerifyModel> verify(VerifyInput verifyInput);
}