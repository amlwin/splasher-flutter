import 'package:built_value/built_value.dart';
import 'package:splasher_flutter/model/links.dart';
import 'package:splasher_flutter/model/urls.dart';
import 'package:splasher_flutter/model/user.dart';

part 'photo.g.dart';

abstract class Photo implements Built<Photo, PhotoBuilder> {
  String get id;
  int get width;
  int get height;
  User get user;
  Links get links;
  Urls get urls;

  Photo._();
  factory Photo([void Function(PhotoBuilder) updates]) = _$Photo;
}
