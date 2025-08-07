import 'package:post_bookmark/post/data/data_source/post_data_source.dart';
import 'package:post_bookmark/post/data/dto/post_dto.dart';
import 'package:post_bookmark/post/data/mapper/post_mapper.dart';
import 'package:post_bookmark/post/domain/model/post.dart';
import 'package:post_bookmark/post/domain/respository/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostDataSource _dataSource;

  const PostRepositoryImpl({required PostDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<List<Post>> findAll() async {
    final List<PostDto> dtos = await _dataSource.findAll();

    return dtos.map((dto) => dto.toModel()).toList();
  }

  @override
  Future<Post> findByPostId({required int postId}) async {
    final PostDto dto = await _dataSource.findByPostId(postId: postId);

    return dto.toModel();
  }
}
