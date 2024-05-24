import 'package:chd_task_ahmed_ayman/core/utils/app_injector.dart';
import 'package:chd_task_ahmed_ayman/core/utils/cache_helper.dart';
import 'package:chd_task_ahmed_ayman/core/utils/request_status.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/domain/models/inputs/verify_input.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/presentation/pages/verify/verify_cubit.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/presentation/pages/verify/verify_states.dart';
import 'package:chd_task_ahmed_ayman/features/home/presentation/pages/main_navigator_page.dart';
import 'package:chd_task_ahmed_ayman/features/authentication/presentation/widgets/otp_pin_code_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyPage extends StatelessWidget {
  final String phoneNumber;
  final String identity;
  final int otp;

  const VerifyPage({super.key,
    required this.phoneNumber,
    required this.identity,
    required this.otp,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerifyCubit(injector()),
      child: VerifyPageBody(
        otp: otp,
        phoneNumber: phoneNumber,
        identity: identity,
      ),
    );
  }
}

class VerifyPageBody extends StatefulWidget {
  final int otp;
  final String phoneNumber;
  final String identity;

  const VerifyPageBody(
      {super.key,
      required this.otp,
      required this.phoneNumber,
      required this.identity});

  @override
  State<VerifyPageBody> createState() => _VerifyPageBodyState();
}

class _VerifyPageBodyState extends State<VerifyPageBody> {
  final codeController = TextEditingController();

  @override
  void initState() {
    codeController.text = widget.otp.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerifyCubit, VerifyStates> (
      listener: (context, state) {
        if (state.verifyStatus == RequestStatus.success) {
          CacheHelper.saveData(key: 'token', value: state.verifyModel?.token);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.verifyModel?.message ?? ''),
            backgroundColor: Colors.green,
          ));
          Navigator.push(context, MaterialPageRoute(builder: (context) =>MainNavigatorPage(),));
        }
          if (state.verifyStatus == RequestStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.errorMessage ?? ''),
              backgroundColor: Colors.red,
            ));
          }

      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OtpPinCodeWidget(
                hasError: false,
                onChange: (value) {},
                codeController: codeController,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<VerifyCubit>(context).verify(VerifyInput(
                      widget.identity,
                      codeController.text,
                      widget.phoneNumber,
                      "erere4t565"));
                },
                child: const SizedBox(width:double.infinity,child: Text('Submit')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
