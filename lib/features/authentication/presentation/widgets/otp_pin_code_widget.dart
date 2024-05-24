import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

const int otpFieldsLength = 4;

class OtpPinCodeWidget extends StatelessWidget {
  OtpPinCodeWidget(
      {super.key,
      required this.hasError,
      required this.onChange,
      this.validator,
      required this.codeController,
      this.length = otpFieldsLength,
      this.borderColor = Colors.green,
      this.disabledBorderColor = Colors.green,
      this.focusBorderColor,
      this.fieldColor,
      this.hintCharacter});
  final bool hasError;
  final void Function(String value) onChange;
  final String? Function(String?)? validator;
  final TextEditingController codeController;
  final int length;
  final Color borderColor;
  final Color disabledBorderColor;
  final Color? focusBorderColor;
  final Color? fieldColor;
  final String? hintCharacter;
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: SizedBox(
        // width: MediaQuery.sizeOf(context).width,
        child: PinCodeTextField(
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp('[0-9]'))
          ],
          appContext: context,
          length: length,
          focusNode: _focusNode,
          enableActiveFill: true,
          keyboardType: TextInputType.phone,
          textStyle: TextStyle(
            fontSize: 22,
            color: Colors.green,
          ),
          hintCharacter: hintCharacter ?? '__',
          hintStyle: const TextStyle(
            height: 2,
          ),
          pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              // fieldHeight: 48,
              // fieldWidth: MediaQuery.sizeOf(context).width,
              activeColor: hasError
                  ? Colors.orange
                  : borderColor ,
              disabledColor: disabledBorderColor ,
              activeFillColor: fieldColor ?? Colors.white,
              inactiveFillColor: fieldColor ?? Colors.white,
              selectedFillColor: fieldColor ?? Colors.white,
              borderWidth: 1,
              inactiveColor: fieldColor ?? Colors.green,
              selectedColor: Colors.green,
              errorBorderColor:
                  hasError ? Colors.orange : Colors.green,
              borderRadius: BorderRadius.circular(4),

              fieldOuterPadding:
                  EdgeInsets.symmetric(horizontal:4)),
          animationType: AnimationType.fade,
          onChanged: onChange,
          showCursor: true,
          cursorColor: Colors.green,
          validator: validator,
          mainAxisAlignment: MainAxisAlignment.center,
          controller: codeController,
          autoDisposeControllers: false,
          cursorHeight: 17,
        ),
      ),
    );
  }
}
