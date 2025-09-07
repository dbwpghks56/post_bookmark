import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:post_bookmark/core/base/base_action.dart';
import 'package:post_bookmark/core/base/base_state.dart';
import 'package:post_bookmark/core/base/base_view_model.dart';

class BaseActionWidget<S extends BaseState<S>, A extends BaseAction>
    extends ConsumerWidget {
  final StateNotifierProvider<BaseViewModel<S, A>, S> provider;
  final void Function(BaseViewModel<S, A> viewModel) onAction;
  final Widget child;
  const BaseActionWidget({
    super.key,
    required this.provider,
    required this.child,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(provider.notifier);

    return GestureDetector(
      onTap: () {
        onAction(viewModel);
      },
      child: child,
    );
  }
}
