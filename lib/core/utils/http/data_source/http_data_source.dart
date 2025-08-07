import 'package:http/http.dart';

abstract interface class HttpDataSource {
  Future<Response> get(Uri url, {Map<String, String>? headers});
}
