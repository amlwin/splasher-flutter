import 'package:built_value/built_value.dart';

part 'user.g.dart';

abstract class User implements Built<User, UserBuilder> {
  String get username;
  String get name;
  @BuiltValueField(wireName: 'portfolio_url')
  String get portfolioUrl;
  @BuiltValueField(wireName: 'total_likes')
  int get totalLike;
  @BuiltValueField(wireName: 'total_photos')
  int get totalPhotos;
  User._();
  factory User([void Function(UserBuilder) updates]) = _$User;
}
