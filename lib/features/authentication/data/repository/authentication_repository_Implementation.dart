import 'dart:convert';

import 'package:chd_task_ahmed_ayman/core/utils/dio_helper.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/data/api_register_model.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/data/mappers/api_register_mapper.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/data/models/api_login_input.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/data/models/api_register_model.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/domain/models/inputs/login_input.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/domain/models/inputs/register_input.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/domain/models/inputs/verify.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/domain/models/regiser_model.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/domain/repository/authentication_repository.dart';

class AuthenticationRepositoryImplementation extends AuthenticationRepository {

  AuthenticationRepositoryImplementation();

  @override
  Future<RegisterModel> register(RegisterInput registerInput) async {
    final response = await DioHelper.postData(
      url: 'auth/register',
      data: ApiRegisterInput.fromInput(registerInput).toJson(),
    );

    if (response.statusCode == 200) {
      return ApiRegisterModel.fromJson(jsonDecode(response.data)).mapToRegister();
    } else {
      throw Exception(jsonDecode(jsonDecode(response.data['message'])));
    }
  }

  @override
  Future<void> login(LoginModel loginModel) async {
    final response = await DioHelper.postData(
      url: 'auth/login',
      data: ApiLoginInput.fromInput(loginModel).toJson(),
    );

    if (response.statusCode == 200) {
      print(jsonDecode(response.data['message']));
      return;
    } else {
      throw Exception(jsonDecode(response.data['message']));
    }
  }

  @override
  Future<String> verify(VerifyModel verifyModel) {
    // TODO: implement verify
    throw UnimplementedError();
  }
}