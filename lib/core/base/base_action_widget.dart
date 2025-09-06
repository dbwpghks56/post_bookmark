import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:post_bookmark/core/base/base_state.dart';
import 'package:post_bookmark/core/base/base_view_model.dart';
import 'package:post_bookmark/presentation/screen/posts/post_action.dart';

class BaseActionWidget<S extends BaseState<S>, V extends BaseViewModel<S>>
    extends ConsumerWidget {
  final StateNotifierProvider<V, S> provider;
  final PostAction onPressed;
  final Widget child;
  const BaseActionWidget({
    super.key,
    required this.provider,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final action = ref.read(provider.notifier);

    return GestureDetector(
      onTap: () {
        action.onAction(onPressed);
      },
      child: child,
    );
  }
}
