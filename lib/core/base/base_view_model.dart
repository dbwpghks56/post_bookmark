import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:post_bookmark/core/base/base_action.dart';
import 'package:post_bookmark/core/base/base_state.dart';
import 'package:post_bookmark/presentation/screen/posts/post_action.dart';

abstract class BaseViewModel<T extends BaseState<T>> extends StateNotifier<T> {
  BaseViewModel(super._state);

  Future<void> execute({required Future<void> Function() action}) async {
    try {
      state = state.copyWith(isLoading: true);

      await action();
      await Future.delayed(Duration(seconds: 1));
    } on Exception catch (e) {
      state = state.copyWith(isLoading: false, error: e);
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> init();
  Future<void> onAction(PostAction action);
}
