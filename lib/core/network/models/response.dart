class HttpResponse<T> {
  final T? data;
  final int statusCode;
  final String? statusMessage;
  final Map<String, dynamic> headers;

  const HttpResponse({
    required this.data,
    required this.statusCode,
    this.statusMessage,
    this.headers = const {},
  });

  bool get isSuccessful => statusCode >= 200 && statusCode < 300;
}
