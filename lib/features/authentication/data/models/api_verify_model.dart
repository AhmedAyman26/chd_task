class ApiVerifyResponse {
  final String? message;
  final String? accessToken;
  final String? tokenType;
  final int? status;

  ApiVerifyResponse({
    this.message,
    this.accessToken,
    this.tokenType,
    this.status,
  });

  ApiVerifyResponse copyWith({
    String? message,
    String? accessToken,
    String? tokenType,
    int? status,
  }) =>
      ApiVerifyResponse(
        message: message ?? this.message,
        accessToken: accessToken ?? this.accessToken,
        tokenType: tokenType ?? this.tokenType,
        status: status ?? this.status,
      );

  factory ApiVerifyResponse.fromJson(Map<String, dynamic> json) => ApiVerifyResponse(
    message: json["message"],
    accessToken: json["access_token"],
    tokenType: json["token_type"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "access_token": accessToken,
    "token_type": tokenType,
    "status": status,
  };
}
