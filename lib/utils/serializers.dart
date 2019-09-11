import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:splasher_flutter/models/links.dart';
import 'package:splasher_flutter/models/photo.dart';
import 'package:splasher_flutter/models/urls.dart';
import 'package:splasher_flutter/models/user.dart';

part 'serializers.g.dart';

@SerializersFor([Links, Photo, Urls, User])
Serializers serializers = _$serializers;

final standardSerializers =
    (serializers.toBuilder()..addPlugin(new StandardJsonPlugin())).build();

T deserialize<T>(dynamic value) => standardSerializers.deserializeWith<T>(
    standardSerializers.serializerForType(T), value);

BuiltList<T> deserializeListOf<T>(dynamic value) => BuiltList.from(
    value.map((value) => deserialize<T>(value)).toList(growable: false));
