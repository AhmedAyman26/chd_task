import 'package:chd_task_ahmed_ayman/core/utils/app_injector.dart';
import 'package:chd_task_ahmed_ayman/core/utils/request_status.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/domain/models/inputs/login_input.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/presentation/pages/login/login_cubit.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/presentation/pages/login/login_states.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/presentation/pages/register/register_page.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/presentation/pages/verify/verify_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:uuid/uuid.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LoginCubit(injector()),
        child: const LoginPageBody());
  }
}

class LoginPageBody extends StatefulWidget {
  const LoginPageBody({super.key});

  @override
  State<LoginPageBody> createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<LoginPageBody> {
  Uuid uniqueIdentifier = const Uuid();

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _identityNumberController =
  TextEditingController();
  String dialCode = '+966';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state.loginState == RequestStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.loginResponse?.message??''),
              backgroundColor: Colors.green,
            ));
            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                VerifyPage(phoneNumber: _phoneController.text,
                    identity: _identityNumberController.text,
                    otp: state.loginResponse?.otp ?? 0),));
          }
          if (state.loginState == RequestStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.errorMessage??''),
              backgroundColor: Colors.red,
            ));
          }
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                const Text(
                  'Hello',
                  style: TextStyle(fontSize: 30),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Welcome back. you have been missed during this time!',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Phone',
                  style: TextStyle(fontSize: 18),
                ),
                IntlPhoneField(
                  onChanged: (value) {
                    dialCode = value.countryCode;
                  },
                  controller: _phoneController,
                ),
                TextFormField(
                  controller: _identityNumberController,
                  decoration:
                  const InputDecoration(label: Text('Identity Number')),
                ),
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                            MaterialStatePropertyAll(Colors.blue)),
                        onPressed: () {
                          context.read<LoginCubit>().login(LoginInput(
                              phone: _phoneController.text,
                              dialCode: dialCode,
                              identity: _identityNumberController.text));
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: const Text('Use Email address?'))
                  ],
                ),
                const Divider(
                  height: 1,
                  color: Colors.grey,
                ),
                const Spacer(),
                Center(
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterPage(),
                              ));
                        },
                        child: const Text(
                          "Don't have an account? Register",
                          style: TextStyle(color: Colors.blue, fontSize: 18),
                        ))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
