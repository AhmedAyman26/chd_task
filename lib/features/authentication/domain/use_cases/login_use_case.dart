import 'package:chd_task_ahmed_ayman/features/authentication/domain/models/inputs/login_input.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/domain/repository/authentication_repository.dart';

class LoginUseCase
{
  final AuthenticationRepository _authenticationRepository;

  LoginUseCase(this._authenticationRepository);

  Future<void> call(LoginModel loginModel)
  {
    return _authenticationRepository.login(loginModel);
  }
}