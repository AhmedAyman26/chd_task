import 'package:chd_task_ahmed_ayman/features/authentication/domain/models/inputs/register_input.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/domain/models/regiser_model.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/domain/repository/authentication_repository.dart';

class RegisterUseCase
{
  final AuthenticationRepository _authenticationRepository;

  RegisterUseCase(this._authenticationRepository);

  Future<RegisterModel> call(RegisterInput registerModel)
  {
    return _authenticationRepository.register(registerModel);
  }

}