import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:post_bookmark/core/utils/errors/post_error.dart';
import 'package:post_bookmark/core/utils/http/data_source/http_data_source.dart';
import 'package:post_bookmark/core/utils/http/http_url.dart';
import 'package:post_bookmark/post/data/data_source/post_data_source.dart';
import 'package:post_bookmark/post/data/dto/post_dto.dart';

class PostDataSourceImpl implements PostDataSource {
  final HttpDataSource _httpClient;

  const PostDataSourceImpl({required HttpDataSource httpClient})
    : _httpClient = httpClient;

  @override
  Future<List<PostDto>> findAll() async {
    final Response response = await _httpClient.get(
      Uri.parse(HttpUrl.baseUrl),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> json = jsonDecode(response.body);

      return json.map((j) => PostDto.fromJson(j)).toList();
    } else {
      throw PostError.networkError;
    }
  }

  @override
  Future<PostDto> findByPostId({required int postId}) async {
    final Response response = await _httpClient.get(
      Uri.parse('${HttpUrl.baseUrl}/$postId'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
      },
    );

    if (response.statusCode == 200) {
      final dynamic json = jsonDecode(response.body);

      return PostDto.fromJson(json);
    } else {
      throw PostError.networkError;
    }
  }
}
