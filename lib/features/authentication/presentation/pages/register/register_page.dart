import 'package:chd_task_ahmed_ayman/app_injector.dart';
import 'package:chd_task_ahmed_ayman/core/utils/request_status.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/domain/models/inputs/register_input.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/presentation/pages/register/register_cubit.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/presentation/pages/register/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => RegisterCubit(injector()),
        child: const RegisterPageBody());
  }
}

class RegisterPageBody extends StatefulWidget {
  const RegisterPageBody({super.key});

  @override
  State<RegisterPageBody> createState() => _RegisterPageBodyState();
}

class _RegisterPageBodyState extends State<RegisterPageBody> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController identityNumberController = TextEditingController();

  String dialCode = '+20';
  String type = '';

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    identityNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: BlocListener<RegisterCubit, RegisterStates>(
            listener: (context, state) {
              if (state.registerState == RequestStatus.success) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.registerModel.message!),
                  backgroundColor: Colors.green,
                ));
              }
              if (state.registerState == RequestStatus.error) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.errorMessage),
                  backgroundColor: Colors.red,
                ));
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Register',
                  style: TextStyle(fontSize: 30),
                ),
                const SizedBox(height: 40),
                const Text('FirstName'),
                TextFormField(
                  controller: firstNameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const Text('LastName'),
                TextFormField(
                    controller: lastNameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
                const Text('type'),
                DropdownButtonFormField(
                  value: types[0],
                  items: types
                      .map((e) => DropdownMenuItem(value: e,child: Text(e),))
                      .toList(),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onChanged: (value) {
                    // type = value;
                    setState(() {});
                  },
                ),
                const Text('phoneNumber'),
                IntlPhoneField(
                  onChanged: (value) {
                    dialCode = value.countryCode;
                  },
                  controller: phoneNumberController,
                ),
                const Text('identityNumber'),
                TextFormField(
                    controller: identityNumberController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
                const Spacer(),
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.blue)),
                        onPressed: () {
                          context.read<RegisterCubit>().register(
                                RegisterInput(
                                    phone:
                                        int.parse(phoneNumberController.text),
                                    dialCode: '20',
                                    identity: identityNumberController.text,
                                    firstName: firstNameController.text,
                                    lastName: lastNameController.text,
                                    type: type),
                              );
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List types = ['INDIVIDUAL', 'BUSINESS'];
