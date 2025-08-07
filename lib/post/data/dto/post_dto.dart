import 'package:json_annotation/json_annotation.dart';

part 'post_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class PostDto {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  const PostDto({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostDto.fromJson(Map<String, dynamic> json) =>
      _$PostDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PostDtoToJson(this);
}
