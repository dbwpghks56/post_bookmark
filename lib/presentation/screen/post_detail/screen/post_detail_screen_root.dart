import 'package:flutter/material.dart';
import 'package:post_bookmark/presentation/screen/post_detail/post_detail_view_model.dart';
import 'package:post_bookmark/presentation/screen/post_detail/screen/post_detail_screen.dart';

class PostDetailScreenRoot extends StatelessWidget {
  final PostDetailViewModel viewModel;
  const PostDetailScreenRoot({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, _) {
        return PostDetailScreen(state: viewModel.state);
      },
    );
  }
}
