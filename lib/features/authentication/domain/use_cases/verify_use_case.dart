import 'package:chd_task_ahmed_ayman/features/authentication/domain/models/inputs/verify_input.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/domain/models/verify_model.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/domain/repository/authentication_repository.dart';

class VerifyUseCase
{
  final AuthenticationRepository _authenticationRepository;

  VerifyUseCase(this._authenticationRepository);

  Future<VerifyModel> call(VerifyInput verifyInput)
  {
    return _authenticationRepository.verify(verifyInput);
  }
}