abstract class BaseState {
  bool _isLoading = false;
  bool _isRefresh = false;
  Exception? error;

  bool get isLoading => _isLoading;
  bool get isRefresh => _isRefresh;

  void processDone() {
    _isLoading = false;
  }

  void processLoading() {
    _isLoading = true;
  }
}
