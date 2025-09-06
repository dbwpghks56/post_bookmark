import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:post_bookmark/core/base/base_state.dart';
import 'package:post_bookmark/core/base/base_state_widget.dart';
import 'package:post_bookmark/core/base/base_view_model.dart';

class BaseConsumerWidget<S extends BaseState<S>, V extends BaseViewModel<S>>
    extends ConsumerWidget {
  final StateNotifierProvider<V, S> provider;
  final Widget child;
  final Widget? loadingWidget;

  const BaseConsumerWidget({
    super.key,
    required this.provider,
    required this.child,
    this.loadingWidget,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(provider);
    final action = ref.read(provider.notifier);

    return BaseStateWidget<S, V>(
      state: state,
      viewModel: action,
      loadingWidget: loadingWidget,
      child: child,
    );
  }
}
