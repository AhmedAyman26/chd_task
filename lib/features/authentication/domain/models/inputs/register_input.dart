import 'package:chd_task_ahmed_ayman/features/authentication/domain/models/inputs/login_input.dart';

class RegisterInput extends LoginInput {
  final String firstName;
  final String lastName;
  final String type;

  RegisterInput({required super.phone,required super.dialCode, required super.identity,required this.firstName,
      required this.lastName,required this.type});
}
