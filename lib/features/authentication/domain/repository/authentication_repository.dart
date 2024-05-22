import 'package:chd_task_ahmed_ayman/features/authentication/domain/models/inputs/login_input.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/domain/models/inputs/register_input.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/domain/models/inputs/verify.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/domain/models/regiser_model.dart';

abstract class AuthenticationRepository {
  Future<void> login(LoginModel loginModel);
  Future<RegisterModel> register(RegisterInput registerInput);
  Future<String> verify(VerifyModel verifyModel);
  
}