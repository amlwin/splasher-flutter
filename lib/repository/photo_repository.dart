import 'package:built_collection/built_collection.dart';
import 'package:splasher_flutter/models/photo_list_response.dart';

abstract class PhotoRepository {
  Future<PhotoListResponse> loadPhoto();
}
