import 'package:post_bookmark/post/data/dto/post_dto.dart';

abstract interface class PostDataSource {
  Future<List<PostDto>> findAll();
  Future<PostDto> findByPostId({required int postId});
}
