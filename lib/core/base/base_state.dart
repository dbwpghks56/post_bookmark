abstract class BaseState<T> {
  final bool isLoading;
  final bool isRefresh;
  final Map<String, bool> componentsLoading;
  final Exception? error;

  const BaseState({
    this.isLoading = false,
    this.isRefresh = false,
    this.error,
    this.componentsLoading = const {},
  });

  // 하위 클래스에서 구현해야 하는 copyWith 메서드
  T copyWith({bool? isLoading, bool? isRefresh, Exception? error});
}
