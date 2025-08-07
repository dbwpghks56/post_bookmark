import 'package:http/src/response.dart';
import 'package:http/http.dart' as http;
import 'package:post_bookmark/core/utils/errors/post_error.dart';
import 'package:post_bookmark/core/utils/http/data_source/http_data_source.dart';

class HttpDataSourceImpl implements HttpDataSource {
  @override
  Future<Response> get(Uri url, {Map<String, String>? headers}) async {
    return http
        .get(url, headers: headers)
        .timeout(
          const Duration(seconds: 10),
          onTimeout: () {
            throw PostError.timeoutError;
          },
        );
  }
}
