import 'package:built_value/built_value.dart';

part 'urls.g.dart';

abstract class Urls implements Built<Urls, UrlsBuilder> {
  String get raw;
  String get full;
  String get regular;
  String get small;
  String get thumb;
  Urls._();
  factory Urls([void Function(UrlsBuilder) updates]) = _$Urls;
}
