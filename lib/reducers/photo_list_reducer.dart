import 'package:built_collection/built_collection.dart';
import 'package:redux/redux.dart';
import 'package:splasher_flutter/actions/actions.dart';
import 'package:splasher_flutter/state/photo_list_state.dart';

final Reducer<PhotoListState> photoListReducer =
    combineReducers<PhotoListState>([
  TypedReducer<PhotoListState, PhotoLoadedAction>(_onPhotoListLoaded),
  TypedReducer<PhotoListState, PhotoLoadFailedAction>(_onPhotoListLoadFailed)
]);

PhotoListState _onPhotoListLoaded(
    PhotoListState state, PhotoLoadedAction action) {
  return PhotoListState(isLoading: false, photos: action.photos);
}

PhotoListState _onPhotoListLoadFailed(
    PhotoListState state, PhotoLoadFailedAction action) {
  return PhotoListState(isLoading: false, photos: BuiltList.from([]));
}
