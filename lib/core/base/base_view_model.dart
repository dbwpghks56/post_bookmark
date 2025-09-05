import 'package:post_bookmark/core/base/base_state.dart';
import 'package:riverpod/riverpod.dart';

abstract class BaseViewModel<T extends BaseState> extends StateNotifier<T> {
  BaseViewModel(super.state);

  Future<void> init({required Future<void> Function() initFunc}) async {
    state.processLoading();
    await initFunc();
    state.processDone();
  }
}
