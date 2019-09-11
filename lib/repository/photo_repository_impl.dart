import 'package:built_collection/src/list.dart';
import 'package:splasher_flutter/access_key.dart';
import 'package:splasher_flutter/models/photo.dart';
import 'package:splasher_flutter/repository/photo_repository.dart';
import 'package:http/http.dart' as http;

class PhotoRepositoryImpl implements PhotoRepository {
  final http.Client client;
  PhotoRepositoryImpl(this.client);
  final base_url = "https://api.unsplash.com/";
  final photo_list_url = "photos";
  final key = "?client_id=${AccessKey.clientId}";

  @override
  Future<BuiltList<Photo>> loadPhoto() async {
    final http.Response response =
        await http.get(base_url + photo_list_url + key);
    return Future.value(Photo.fromJsonList(response.body));
  }
}
