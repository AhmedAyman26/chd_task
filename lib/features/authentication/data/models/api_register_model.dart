
import 'package:chd_task_ahmed_ayman/features/authentication/domain/models/inputs/register_input.dart';

class ApiRegisterInput {
  final String dial_code;
  final String first_name;
  final String last_name;
  final String identity;
  final int phone;
  final String type;

  factory ApiRegisterInput.fromInput(RegisterInput registerModel) {
    return ApiRegisterInput(
      dial_code: registerModel.dialCode,
      first_name: registerModel.firstName,
      last_name: registerModel.lastName,
      identity: registerModel.identity,
      phone: registerModel.phone,
      type: registerModel.type,
    );
  }

  ApiRegisterInput(
      {required this.dial_code,
      required this.first_name,
      required this.last_name,
      required this.identity,
      required this.phone,
      required this.type});

  Map<String,dynamic>toJson()
  {
    return {
      'dial_code':dial_code,
      'first_name':first_name,
      'last_name':last_name,
      'identity':identity,
      'phone':phone,
      'type':type,
    };
  }
}
