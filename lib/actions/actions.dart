import 'package:built_collection/built_collection.dart';
import 'package:splasher_flutter/models/photo.dart';

class PhotoLoadAction {}

class PhotoLoadedAction {
  final BuiltList<Photo> photos;
  PhotoLoadedAction(this.photos);
}

class PhotoLoadFailedAction {}
