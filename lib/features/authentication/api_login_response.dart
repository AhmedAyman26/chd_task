class ApiLoginResponse {
  final String? message;
  final int? otp;

  ApiLoginResponse({this.message, this.otp});

  factory ApiLoginResponse.fromJson(Map<String, dynamic> json) {
    return ApiLoginResponse(message: json['message'], otp: json['otp']);
  }
}
