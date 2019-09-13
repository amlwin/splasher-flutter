import 'package:built_collection/built_collection.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:splasher_flutter/actions/actions.dart';
import 'package:splasher_flutter/models/app_state.dart';
import 'package:splasher_flutter/models/photo.dart';
import 'package:splasher_flutter/repository/photo_repository.dart';

List<Middleware<AppState>> appMiddleware(PhotoRepository repository) {
  //final _loadPhotos = _createPhotosLoad(repository);

  return [
    TypedMiddleware<AppState, PhotoLoadAction>(_loadPhotos(repository)),
    LoggingMiddleware.printer(),
  ];
}

void Function(Store<AppState> store, dynamic action, NextDispatcher dispatcher)
    _loadPhotos(PhotoRepository repository) {
  //return Middleware
  print("calling");
  return (store, action, next) {
    print("start load");
    repository.loadPhoto().then((BuiltList<Photo> photos) {
      store.dispatch(PhotoLoadedAction(photos));
    }).then((error) {
      //store.dispatch(PhotoLoadFailedAction());
    });
    next(action);
  };
}
