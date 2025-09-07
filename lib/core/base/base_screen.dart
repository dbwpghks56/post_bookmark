import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:post_bookmark/core/base/base_action.dart';
import 'package:post_bookmark/core/base/base_state.dart';
import 'package:post_bookmark/core/base/base_view_model.dart';

abstract class BaseScreen<
  S extends BaseState<S>,
  A extends BaseAction,
  V extends BaseViewModel<S, A>
>
    extends StatelessWidget {
  final StateNotifierProvider<V, S> provider;

  const BaseScreen({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return buildScreen(context);
  }

  // 하위 클래스에서 구현
  Widget buildScreen(BuildContext context);

  // 액션 처리
  Future<void> handleAction(
    BuildContext context,
    A action,
    BaseViewModel<S, A> viewModel,
  );

  // 초기화 필요 여부
  bool get needsInit => false;
}
