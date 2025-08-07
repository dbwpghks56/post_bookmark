import 'package:go_router/go_router.dart';
import 'package:post_bookmark/core/di/di_setup.dart';
import 'package:post_bookmark/core/routing/routes.dart';
import 'package:post_bookmark/presentation/screen/post_detail/post_detail_view_model.dart';
import 'package:post_bookmark/presentation/screen/post_detail/screen/post_detail_screen_root.dart';
import 'package:post_bookmark/presentation/screen/posts/post_view_model.dart';
import 'package:post_bookmark/presentation/screen/posts/screen/post_screen_root.dart';

final router = GoRouter(
  initialLocation: Routes.posts,
  routes: [
    GoRoute(
      path: Routes.posts,
      builder: (context, state) {
        final PostViewModel viewModel = getIt<PostViewModel>();

        viewModel.init();

        return PostScreenRoot(viewModel: viewModel);
      },
    ),
    GoRoute(
      path: Routes.detail,
      builder: (context, state) {
        final PostDetailViewModel viewModel = getIt<PostDetailViewModel>();

        final int id = int.parse(state.pathParameters['id']!);
        print(id);
        viewModel.init(postId: id);

        return PostDetailScreenRoot(viewModel: viewModel);
      },
    ),
  ],
);
