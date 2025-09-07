import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:post_bookmark/core/base/base_action_widget.dart';
import 'package:post_bookmark/core/base/base_consumer_widget.dart';
import 'package:post_bookmark/core/base/base_screen.dart';
import 'package:post_bookmark/core/base/base_view_model.dart';
import 'package:post_bookmark/core/routing/routes.dart';
import 'package:post_bookmark/core/utils/route_util.dart';
import 'package:post_bookmark/presentation/screen/posts/post_action.dart';
import 'package:post_bookmark/presentation/screen/posts/post_state.dart';
import 'package:post_bookmark/presentation/screen/posts/post_view_model.dart';

class PostScreenRoot extends BaseScreen<PostState, PostAction, PostViewModel> {
  const PostScreenRoot({super.key, required super.provider});

  @override
  Widget buildScreen(BuildContext context) {
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
            onInit: true,
            child: Column(children: [Text('로딩 끝')]),
          ),
          BaseActionWidget<PostState, PostAction>(
            provider: provider,
            onAction: (viewModel) {
              handleAction(context, PostAction.tapPost(postId: 1), viewModel);
            },
            child: Text('loading'),
          ),
          BaseActionWidget<PostState, PostAction>(
            provider: provider,
            onAction: (viewModel) {
              handleAction(
                context,
                PostAction.tapBookMark(postId: 1),
                viewModel,
              );
            },
            child: Text('loading'),
          ),
        ],
      ),
    );
  }

  @override
  Future<void> handleAction(
    BuildContext context,
    PostAction action,
    BaseViewModel<PostState, PostAction> viewModel,
  ) async {
    switch (action) {
      case TapPost():
        context.push(Routes.detail.changeIdtoValue(id: action.postId));
        break;
      case TapBookMark():
        viewModel.onAction(action);
        break;
    }
  }
}
