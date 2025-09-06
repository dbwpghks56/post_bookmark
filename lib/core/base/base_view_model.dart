import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:post_bookmark/core/base/base_state.dart';

abstract class BaseViewModel<T extends BaseState> extends StateNotifier<T> {
  BaseViewModel(super._state);

  Future<void> excute({required Future<void> Function() action}) async {
    try {
      state.processLoading();
      await action();
    } on Exception catch (e) {
      state.error = e;
    } finally {
      state.processDone();
    }
  }
}
