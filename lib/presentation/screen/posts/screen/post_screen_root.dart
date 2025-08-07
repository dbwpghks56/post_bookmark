import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:post_bookmark/core/routing/routes.dart';
import 'package:post_bookmark/core/utils/route_util.dart';
import 'package:post_bookmark/presentation/screen/posts/post_action.dart';
import 'package:post_bookmark/presentation/screen/posts/post_view_model.dart';
import 'package:post_bookmark/presentation/screen/posts/screen/post_screen.dart';

class PostScreenRoot extends StatelessWidget {
  final PostViewModel viewModel;
  const PostScreenRoot({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, _) {
        return PostScreen(
          state: viewModel.state,
          onAction: (PostAction action) async {
            switch (action) {
              case TapPost():
                context.push(Routes.detail.changeIdtoValue(id: action.postId));
              case TapBookMark():
                await viewModel.onAction(action);
            }
          },
        );
      },
    );
  }
}
