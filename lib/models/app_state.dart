class AppState {
  bool isLoading;

  AppState({this.isLoading});
  factory AppState.loading() {
    return AppState(isLoading: true);
  }
}
