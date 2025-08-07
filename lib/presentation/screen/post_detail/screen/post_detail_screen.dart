import 'package:flutter/material.dart';
import 'package:post_bookmark/presentation/screen/post_detail/post_detail_action.dart';
import 'package:post_bookmark/presentation/screen/post_detail/post_detail_state.dart';

class PostDetailScreen extends StatelessWidget {
  final PostDetailState state;
  final void Function(PostDetailAction action) onAction;
  const PostDetailScreen({
    super.key,
    required this.state,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: state.isLoading == false
          ? SafeArea(
              child: Column(
                children: [
                  Text(state.post.id.toString()),
                  Text(state.post.userId.toString()),
                  Text(state.post.title.toString()),
                  Text(state.post.body.toString()),
                  Center(
                    child: state.isBookmark
                        ? IconButton(
                            icon: Icon(Icons.bookmark_add),
                            onPressed: () {
                              onAction(
                                PostDetailAction.tapBookMark(
                                  postId: state.post.id,
                                ),
                              );
                            },
                          )
                        : IconButton(
                            icon: Icon(Icons.bookmark_add_outlined),
                            onPressed: () {
                              onAction(
                                PostDetailAction.tapBookMark(
                                  postId: state.post.id,
                                ),
                              );
                            },
                          ),
                  ),
                ],
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
