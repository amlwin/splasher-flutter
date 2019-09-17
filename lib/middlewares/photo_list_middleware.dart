import 'package:built_collection/built_collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';
import 'package:splasher_flutter/actions/actions.dart';
import 'package:splasher_flutter/models/photo.dart';
import 'package:splasher_flutter/repository/photo_repository.dart';
import 'package:splasher_flutter/repository/photo_repository.dart';
import 'package:splasher_flutter/state/app_state.dart';
import 'package:splasher_flutter/state/photo_list_state.dart';

class PhotoListMiddleware extends MiddlewareClass<AppState> {
  final PhotoRepository repository;
  PhotoListMiddleware({@required this.repository});
  @override
  void call(Store<AppState> store, action, NextDispatcher next) {
    if (action is PhotoLoadAction) {
      repository.loadPhoto().then((BuiltList<Photo> photos) {
        store.dispatch(PhotoLoadedAction(photos));
      }).catchError((error) {
        store.dispatch(PhotoLoadFailedAction());
      });
    }
    next(action);
  }
}
