import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:post_bookmark/core/base/base_action.dart';
import 'package:post_bookmark/core/base/base_state.dart';
import 'package:post_bookmark/core/base/base_view_model.dart';

class BaseComponentLoadingWidget<S extends BaseState<S>, A extends BaseAction>
    extends ConsumerStatefulWidget {
  final StateNotifierProvider<BaseViewModel<S, A>, S> provider;
  final Widget child;
  final bool onInit;
  final String componentName;
  final Widget? loadingWidget;

  const BaseComponentLoadingWidget({
    super.key,
    required this.provider,
    required this.child,
    this.onInit = false,
    this.loadingWidget,
    required this.componentName,
  });

  @override
  _BaseComponentLoadingWidgetState createState() =>
      _BaseComponentLoadingWidgetState();
}

class _BaseComponentLoadingWidgetState
    extends ConsumerState<BaseComponentLoadingWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.onInit) {
        ref.read(widget.provider.notifier).init();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(widget.provider);

    return state.componentsLoading[widget.componentName]!
        ? widget.loadingWidget ?? const CircularProgressIndicator()
        : widget.child;
  }
}
