import 'package:flutter/material.dart';
import 'package:post_bookmark/post/domain/model/post.dart';
import 'package:post_bookmark/presentation/screen/posts/post_action.dart';
import 'package:post_bookmark/presentation/screen/posts/post_state.dart';

class PostScreen extends StatelessWidget {
  final PostState state;
  final void Function(PostAction) onAction;

  const PostScreen({super.key, required this.state, required this.onAction});

  @override
  Widget build(BuildContext context) {
    final List<Post> posts = state.posts;
    final Set<String> bookmarks = state.bookmarks;

    return Scaffold(
      body: state.isLoading == false
          ? ListView.separated(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    onAction(PostAction.tapPost(postId: posts[index].id));
                  },
                  behavior: HitTestBehavior.opaque,
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${posts[index].id}'),
                              Text(
                                posts[index].title,
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        bookmarks.contains(posts[index].id.toString())
                            ? IconButton(
                                icon: Icon(Icons.bookmark_add),
                                onPressed: () {
                                  onAction(
                                    PostAction.tapBookMark(
                                      postId: posts[index].id,
                                    ),
                                  );
                                },
                              )
                            : IconButton(
                                icon: Icon(Icons.bookmark_add_outlined),
                                onPressed: () {
                                  onAction(
                                    PostAction.tapBookMark(
                                      postId: posts[index].id,
                                    ),
                                  );
                                },
                              ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, _) {
                return const SizedBox(height: 12);
              },
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
