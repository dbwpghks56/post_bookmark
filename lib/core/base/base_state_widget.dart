import 'package:flutter/material.dart';
import 'package:post_bookmark/core/base/base_action.dart';
import 'package:post_bookmark/core/base/base_state.dart';
import 'package:post_bookmark/core/base/base_view_model.dart';

class BaseStateWidget<
  S extends BaseState<S>,
  A extends BaseAction,
  V extends BaseViewModel<S, A>
>
    extends StatefulWidget {
  final S state;
  final V viewModel;
  final Widget child;
  final Widget? loadingWidget;

  const BaseStateWidget({
    super.key,
    required this.state,
    required this.viewModel,
    required this.child,
    this.loadingWidget,
  });

  @override
  State<BaseStateWidget<S, A, V>> createState() =>
      _BaseStateWidgetState<S, A, V>();
}

class _BaseStateWidgetState<
  S extends BaseState<S>,
  A extends BaseAction,
  V extends BaseViewModel<S, A>
>
    extends State<BaseStateWidget<S, A, V>> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.viewModel.init();
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.state.isLoading
        ? widget.loadingWidget ?? const CircularProgressIndicator()
        : widget.child;
  }
}
