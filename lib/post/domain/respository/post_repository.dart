import 'package:post_bookmark/post/domain/model/post.dart';

abstract interface class PostRepository {
  Future<List<Post>> findAll();
  Future<Post> findByPostId({required int postId});
}
