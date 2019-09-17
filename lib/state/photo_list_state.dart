import 'package:built_collection/built_collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:splasher_flutter/models/photo.dart';

@immutable
class PhotoListState {
  final bool isLoading;
  final BuiltList<Photo> photos;

  PhotoListState({this.isLoading, this.photos});

  factory PhotoListState.initial() {
    return PhotoListState(isLoading: false, photos: BuiltList.from([]));
  }

  PhotoListState copyWith({bool isLoading, BuiltList<Photo> photos}) {
    return PhotoListState(
        isLoading: isLoading ?? this.isLoading, photos: photos ?? this.photos);
  }

  @override
  String toString() {
    super.toString();
    return 'PhotoListState is {isLoading: $isLoading, photos: $photos}';
  }

  @override
  int get hashCode => this.isLoading.hashCode ^ this.photos.hashCode;
}
