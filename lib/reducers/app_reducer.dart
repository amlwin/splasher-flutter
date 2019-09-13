import 'package:built_collection/built_collection.dart';
import 'package:redux/redux.dart';
import 'package:splasher_flutter/actions/actions.dart';
import 'package:splasher_flutter/models/app_state.dart';

final Reducer<AppState> appReducers = combineReducers([
  TypedReducer<AppState, PhotoLoadedAction>(_onPhotoListLoaded),
  TypedReducer<AppState, PhotoLoadFailedAction>(_onPhotoListLoadFailed)
]);

AppState _onPhotoListLoaded(AppState state, PhotoLoadedAction action) {
  print("from reducers");
  return AppState(isLoading: false, photos: action.photos);
}

AppState _onPhotoListLoadFailed(AppState state, PhotoLoadFailedAction action) {
  return AppState(isLoading: false, photos: BuiltList.from([]));
}
