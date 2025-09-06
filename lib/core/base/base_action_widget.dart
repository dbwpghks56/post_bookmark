import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:post_bookmark/core/base/base_action.dart';
import 'package:post_bookmark/core/base/base_state.dart';
import 'package:post_bookmark/core/base/base_view_model.dart';

class BaseActionWidget<
  S extends BaseState<S>,
  A extends BaseAction,
  V extends BaseViewModel<S, A>
>
    extends ConsumerWidget {
  final StateNotifierProvider<V, S> provider;
  final A action;
  final Widget child;
  const BaseActionWidget({
    super.key,
    required this.provider,
    required this.action,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actions = ref.read(provider.notifier);

    return GestureDetector(
      onTap: () {
        actions.onAction(action);
      },
      child: child,
    );
  }
}
