class FetchResponse {
  bool ok;
  int statusCode;
  Map<String, dynamic>? data;
  String? messages;

  FetchResponse(
      {required this.ok, required this.statusCode});

}
