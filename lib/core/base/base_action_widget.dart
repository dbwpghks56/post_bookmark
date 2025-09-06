import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:post_bookmark/core/base/base_state.dart';
import 'package:post_bookmark/core/base/base_view_model.dart';

class BaseActionWidget<S extends BaseState<S>> extends ConsumerWidget {
  final StateNotifierProvider<BaseViewModel<S>, S> provider;
  final Widget child;
  const BaseActionWidget({
    super.key,
    required this.provider,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actions = ref.read(provider.notifier);

    return GestureDetector(onTap: () {}, child: child);
  }
}
