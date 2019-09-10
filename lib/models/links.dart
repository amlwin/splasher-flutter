import 'package:built_value/built_value.dart';

part 'links.g.dart';

abstract class Links implements Built<Links, LinksBuilder> {
  String get self;
  String get html;
  String get photos;
  String get likes;
  String get portfolio;
  Links._();
  factory Links([void Function(LinksBuilder) updates]) = _$Links;
}
