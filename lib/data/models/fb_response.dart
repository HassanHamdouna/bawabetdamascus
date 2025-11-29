class FbResponse {
  final bool status;
  final String message;
  final dynamic data;

  FbResponse({
    required this.status,
    required this.message,
    this.data,
  });
}

final FbResponse successfullyResponse = FbResponse(
  status: true,
  message: "Success",
);

final FbResponse errorResponse = FbResponse(
  status: false,
  message: "Error",
);
