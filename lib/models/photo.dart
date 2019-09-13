import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:splasher_flutter/models/links.dart';
import 'package:splasher_flutter/models/urls.dart';
import 'package:splasher_flutter/models/user.dart';
import 'package:splasher_flutter/utils/serializers.dart';
part 'photo.g.dart';

abstract class Photo implements Built<Photo, PhotoBuilder> {
  static Serializer<Photo> get serializer => _$photoSerializer;

  String get id;

  int get width;

  int get height;

  User get user;

  Links get links;

  Urls get urls;

  Photo._();
  factory Photo([void Function(PhotoBuilder) updates]) = _$Photo;

  static BuiltList<Photo> fromJsonList(String responseString) {
    final List<dynamic> jsonVal = json.decode(responseString);
    return deserializeListOf<Photo>(jsonVal);
  }

  static Photo fromJsonObj(String responseString) {
    final jsonVal = json.decode(responseString);
    return deserialize<Photo>(jsonVal);
  }
}
