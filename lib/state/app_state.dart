import 'package:built_collection/built_collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:splasher_flutter/models/photo.dart';
import 'package:splasher_flutter/state/photo_list_state.dart';

@immutable
class AppState {
  final PhotoListState photoListState;

  AppState(this.photoListState);

  factory AppState.initial() {
    return AppState(PhotoListState.initial());
  }
  AppState copyWith({PhotoListState photoListState}) {
    return AppState(photoListState ?? this.photoListState);
  }

  @override
  String toString() {
    super.toString();
    return 'AppState{photoListState: $photoListState}';
  }

  @override
  int get hashCode => photoListState.hashCode;
}
