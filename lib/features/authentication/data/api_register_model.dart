class ApiRegisterModel {
  final String message;
  final int status;
  final int otp;

  ApiRegisterModel({
    required this.message,
    required this.status,
    required this.otp,
  });

  factory ApiRegisterModel.fromJson(Map<String, dynamic> json) => ApiRegisterModel(
    message: json["message"],
    status: json["status"],
    otp: json["otp"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "otp": otp,
  };
}
