abstract class BaseState<T> {
  bool _isLoading;
  bool _isRefresh;
  T? data;
  Exception? exception;

  BaseState({
    bool isLoading = false,
    bool isRefresh = true,
    this.data,
    this.exception,
  }) : _isLoading = isLoading,
       _isRefresh = isRefresh;

  void processDone() {
    _isLoading = false;
  }

  void processLoading() {
    _isLoading = true;
  }
}
