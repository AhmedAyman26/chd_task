import 'package:chd_task_ahmed_ayman/features/authentication/domain/models/inputs/login_input.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/domain/models/login_model.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/domain/repository/authentication_repository.dart';

class LoginUseCase
{
  final AuthenticationRepository _authenticationRepository;

  LoginUseCase(this._authenticationRepository);

  Future<LoginModel> call(LoginInput loginInput)
  {
    return _authenticationRepository.login(loginInput);
  }
}