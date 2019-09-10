import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:splasher_flutter/model/photo.dart';

part 'photo_list_response.g.dart';

abstract class PhotoListResponse
    implements Built<PhotoListResponse, PhotoListResponseBuilder> {
  BuiltList<Photo> get photos;
  PhotoListResponse._();
  factory PhotoListResponse([void Function(PhotoListResponseBuilder) updates]) =
      _$PhotoListResponse;
}
