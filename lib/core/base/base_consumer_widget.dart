import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:post_bookmark/core/base/base_action.dart';
import 'package:post_bookmark/core/base/base_state.dart';
import 'package:post_bookmark/core/base/base_state_widget.dart';
import 'package:post_bookmark/core/base/base_view_model.dart';

class BaseConsumerWidget<
  S extends BaseState<S>,
  A extends BaseAction,
  V extends BaseViewModel<S, A>
>
    extends ConsumerStatefulWidget {
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
  _BaseConsumerWidgetState createState() => _BaseConsumerWidgetState();
}

class _BaseConsumerWidgetState extends ConsumerState<BaseConsumerWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(widget.provider.notifier).init();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(widget.provider);

    return state.isLoading
        ? widget.loadingWidget ?? const CircularProgressIndicator()
        : widget.child;
  }
}
