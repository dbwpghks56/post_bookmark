import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:post_bookmark/core/base/base_state.dart';

abstract class BaseViewModel<T extends BaseState<T>> extends StateNotifier<T> {
  BaseViewModel(super._state);

  Future<void> excute({required Future<void> Function() action}) async {
    try {
      // 로딩 상태로 변경
      state = state.copyWith(isLoading: true);

      await action();
      await Future.delayed(Duration(seconds: 1));
    } on Exception catch (e) {
      // 에러 상태로 변경
      state = state.copyWith(isLoading: false, error: e);
    } finally {
      // 로딩 완료 상태로 변경
      state = state.copyWith(isLoading: false);
    }
  }
}
