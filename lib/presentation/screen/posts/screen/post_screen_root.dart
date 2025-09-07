import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:post_bookmark/core/di/di_setup.dart';
import 'package:post_bookmark/core/routing/routes.dart';
import 'package:post_bookmark/core/utils/route_util.dart';
import 'package:post_bookmark/presentation/screen/posts/post_action.dart';
import 'package:post_bookmark/presentation/screen/posts/post_state.dart';
import 'package:post_bookmark/presentation/screen/posts/post_view_model.dart';
import 'package:post_bookmark/presentation/screen/posts/screen/post_screen.dart';

class PostScreenRoot extends StatelessWidget {
  final StateNotifierProvider<PostViewModel, PostState> provider;
  const PostScreenRoot({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return PostScreen(
      provider: provider,
      onAction: (action, viewModel) async {
        switch (action) {
          case TapPost():
            context.push(Routes.detail.changeIdtoValue(id: action.postId));
            break;
          case TapBookMark():
            viewModel.onAction(action);
            break;
        }
      },
    );
  }
}
