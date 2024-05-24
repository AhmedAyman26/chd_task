import 'package:chd_task_ahmed_ayman/core/utils/dio_helper.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/data/mappers/api_verify_response_mapper.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/data/models/api_register_model.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/data/mappers/api_register_mapper.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/data/models/api_verify_model.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/data/models/inputs/api_login_input.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/data/models/inputs/api_register_input.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/data/models/inputs/api_verify_input.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/domain/models/inputs/login_input.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/domain/models/inputs/register_input.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/domain/models/inputs/verify_input.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/domain/models/register_model.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/domain/models/verify_model.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/domain/repository/authentication_repository.dart';

class AuthenticationRepositoryImplementation extends AuthenticationRepository {

  AuthenticationRepositoryImplementation();

  @override
  Future<RegisterModel> register(RegisterInput registerInput) async {
    final response = await DioHelper.postData(
      headers: {"X-DID":{registerInput.identity}},
      url: 'auth/register',
      data: ApiRegisterInput.fromInput(registerInput).toJson(),
    );
   if (response.statusCode == 201) {
      return ApiRegisterModel.fromJson(response.data).mapToRegister();
    } else {
      throw Exception(response.data['message']);
    }
  }

  @override
  Future<void> login(LoginInput loginInput) async {
    final response = await DioHelper.postData(
      url: 'auth/login',
      data: ApiLoginInput.fromInput(loginInput).toJson(),
    );

    if ( response.statusCode == 201) {
      return;
    } else {
      throw Exception(response.data['message']);
    }
  }

  @override
  Future<VerifyModel> verify(VerifyInput verifyInput) async {
    final response = await DioHelper.postData(
      url: 'auth/verify',
      data: ApiVerifyInput.fromInput(verifyInput).toJson(),
      headers: {"XDID":{verifyInput.identity}},
    );
    if (response.statusCode == 201) {
      return ApiVerifyResponse.fromJson(response.data).mapToVerify();
    } else {
      throw Exception(response.data['message']);
    }
  }
}