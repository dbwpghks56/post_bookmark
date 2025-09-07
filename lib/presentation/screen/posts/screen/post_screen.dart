import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:post_bookmark/core/base/base_action_widget.dart';
import 'package:post_bookmark/core/base/base_consumer_widget.dart';
import 'package:post_bookmark/presentation/screen/posts/post_action.dart';
import 'package:post_bookmark/presentation/screen/posts/post_state.dart';
import 'package:post_bookmark/presentation/screen/posts/post_view_model.dart';

class PostScreen extends StatelessWidget {
  // final PostState state;
  final void Function(PostAction) onAction;
  final StateNotifierProvider<PostViewModel, PostState> provider;

  const PostScreen({
    super.key,
    // required this.state,
    required this.onAction,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 50),
          Text('Hello'),
          BaseConsumerWidget<PostState, PostAction>(
            provider: provider,
            // loadingWidget: const CircularProgressIndicator(
            //   color: Colors.amberAccent,
            // ),
            child: Column(children: [Text('로딩 끝')]),
          ),
          BaseActionWidget<PostState, PostAction>(
            provider: provider,
            onAction: (viewModel) {
              viewModel.onAction(
                PostAction.tapPost(postId: 1, context: context),
              );
            },
            child: Text('loading'),
          ),
        ],
      ),
    );
  }
}
