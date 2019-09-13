import 'package:flutter/cupertino.dart';

@immutable
class AppState {
  final bool isLoading;

  AppState({this.isLoading});

  factory AppState.loading() {
    return AppState(isLoading: true);
  }
  @override
  String toString() {
    super.toString();
    return 'AppState{isLoading: $isLoading}';
  }

  @override
  int get hashCode => isLoading.hashCode;
}
