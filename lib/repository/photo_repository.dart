import 'package:built_collection/built_collection.dart';
import 'package:splasher_flutter/models/photo.dart';

abstract class PhotoRepository {
  Future<BuiltList<Photo>> loadPhoto();
}
