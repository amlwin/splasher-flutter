import 'package:built_collection/built_collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:splasher_flutter/models/photo.dart';

@immutable
class AppState {
  final bool isLoading;
  final BuiltList<Photo> photos;

  AppState({this.isLoading, this.photos});

  factory AppState.loading() {
    return AppState(isLoading: true, photos: BuiltList.from([]));
  }
  @override
  String toString() {
    super.toString();
    return 'AppState{isLoading: $isLoading, photos: $photos}';
  }

  @override
  int get hashCode => isLoading.hashCode ^ photos.hashCode;
}
