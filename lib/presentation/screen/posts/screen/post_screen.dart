import 'package:flutter/material.dart';
import 'package:post_bookmark/presentation/screen/posts/post_action.dart';
import 'package:post_bookmark/presentation/screen/posts/post_state.dart';

class PostScreen extends StatelessWidget {
  final PostState state;
  final void Function(PostAction) onAction;

  const PostScreen({super.key, required this.state, required this.onAction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: state.isLoading == false
          ? ListView.separated(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    onAction(PostAction.tapPost(postId: state.posts[index].id));
                  },
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('$index'),
                        Text(state.posts[index].title),
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
