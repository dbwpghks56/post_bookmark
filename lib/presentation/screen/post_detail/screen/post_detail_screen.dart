import 'package:flutter/material.dart';
import 'package:post_bookmark/presentation/screen/post_detail/post_detail_state.dart';

class PostDetailScreen extends StatelessWidget {
  final PostDetailState state;
  const PostDetailScreen({super.key, required this.state});

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
                ],
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
