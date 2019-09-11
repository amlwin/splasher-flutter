import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'urls.g.dart';

abstract class Urls implements Built<Urls, UrlsBuilder> {
  static Serializer<Urls> get serializer => _$urlsSerializer;
  String get raw;
  String get full;
  String get regular;
  String get small;
  String get thumb;
  Urls._();
  factory Urls([void Function(UrlsBuilder) updates]) = _$Urls;
}
