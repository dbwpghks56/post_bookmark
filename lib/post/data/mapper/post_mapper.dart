import 'package:post_bookmark/post/data/dto/post_dto.dart';
import 'package:post_bookmark/post/domain/model/post.dart';

extension PostMapper on PostDto {
  Post toModel() {
    return Post(
      userId: userId ?? 0,
      id: id ?? 0,
      title: title ?? 'N/A',
      body: body ?? 'N/A',
    );
  }
}
