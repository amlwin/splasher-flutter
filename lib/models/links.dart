import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'links.g.dart';

abstract class Links implements Built<Links, LinksBuilder> {
  static Serializer<Links> get serializer => _$linksSerializer;
  String get self;
  String get html;
  @nullable
  String get photos;
  @nullable
  String get likes;
  @nullable
  String get portfolio;
  Links._();
  factory Links([void Function(LinksBuilder) updates]) = _$Links;
}
