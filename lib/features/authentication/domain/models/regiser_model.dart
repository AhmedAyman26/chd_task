class RegisterModel {
  final String? message;
  final int? status;
  final int? otp;

  RegisterModel({
    this.message,
    this.status,
    this.otp,
  });

  RegisterModel copyWith({
    String? message,
    int? status,
    int? otp,
  }) =>
      RegisterModel(
        message: message ?? this.message,
        status: status ?? this.status,
        otp: otp ?? this.otp,
      );

  RegisterModel.initial()
      : message = null,
        status = null,
        otp = null;
}
